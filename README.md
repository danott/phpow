Phpow
=====

Develop your legacy PHP applications utilizing POW's TLDs on Mac OS X

Installation
------------

Add this line to your application's Gemfile:

    gem 'phpow'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phpow

Usage
-----

`phpow install`

Creates the apache configuration file that will listen on port 8888

`phpow uninstall`

Removes the apache configuration file that will listen on port 8888

`phpow create`

Creates symbolic links to phpow's `config.ru` and `.powconfig` files in the current working directory.

`phpow destroy`

Removes the symbolic links to phpow's `config.ru` and `.powconfig` files in the current working directory.

### Configuration

By default phpow will set up apache to listen on port 8888, and serve projects from `/Users/username/Sites`. Either one of these defaults can be overridden by creating a `.phpowconfig` file in your home directory.

```
# ~/.phpowconfig Example
export PHPOW_APACHE_PORT=8080
export PHPOW_PROJECTS_DIRECTORY=/Users/username/another/specific/directory
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
