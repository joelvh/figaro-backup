module Figaro
  module Backup
    module Rails
      class Engine < ::Rails::Engine

        config.before_configuration do
          check_things_out! if ::Rails.env.development?
        end

        def check_things_out!
          raise       build_message "Oops... #{Figaro.application.path.inspect} is missing." unless File.exists?(Figaro.application.path)
          raise       build_message "You should really use git!" unless git_installed?
          raise       build_message "Make sure to add #{Figaro.application.path.inspect} to .gitignore!" unless git_ignored?
          return puts(build_message "YAY! Your project lives in Dropbox!") if in_dropbox?(Figaro.application.path)
          raise       build_message "Make sure that #{Figaro.application.path.inspect} is symlinked" unless symlinked?
          raise       build_message "Your symlink #{symlink_target_path.inspect} should be in Dropbox!" unless symlinked_to_dropbox?
          puts        build_message "YAY! Your Figaro config is symlinked to Dropbox!"
        end

        def git_installed?
          `which git; echo $?`.to_i == 0
        end

        def git_ignored?
          `git check-ignore "#{Figaro.application.path}"; echo $?`.to_i == 0
        end

        def git_root_path
          `git rev-parse --show-toplevel`.strip
        end

        def symlinked?
          File.symlink?(Figaro.application.path)
        end

        def symlink_target_path
          File.readlink(Figaro.application.path) if symlinked?
        end

        def symlinked_to_dropbox?
          symlinked? && in_dropbox?(symlink_target_path)
        end

        def in_dropbox?(file_path)
          dir = File.dirname(file_path)
          
          return false if dir == '/' || dir == Dir.home

          check = %w{.dropbox .dropbox.cache}
          files = check.map{|file| File.join(dir, file)}
          found = files.any?{|path| Dir.exists?(path)}

          found || in_dropbox?(dir)
        end

        def build_message(message)
          "[Figaro Backup] #{message}"
        end
      end
    end
  end
end
