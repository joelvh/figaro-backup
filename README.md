# Figaro Backup

Easily validate that your `application.yml` is stored outside your git repo via symlink. Ideally, the symlink stores your config in Dropbox for easy backup and reference from multiple computers (depending on your workflow).

## Installation

Add this line to your application's Gemfile:

    gem 'figaro-backup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install figaro-backup

### Dependencies

* rails gem
* figaro gem

## Usage

Runs automatically, only when the environment is "development". Throws an exception if not symlinked to Dropbox.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/figaro-backup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
