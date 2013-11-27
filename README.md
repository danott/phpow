Phpow
=====

Develop PHP applications using POW's TLDs on Mac OS X.

Wat?
----

[POW](http://pow.cx) and Apache are in an eternal battle for port 80. POW gives nice `.dev` domains that you want to use for every project, including PHP, so it wins.

**phpow** is a simple script that installs an Apache `.conf` file setting up a `VirtualHost` so you can map `project-name.dev` to your `~/Sites/project-folder/` PHP application.

To bridge the gap between POW and Apache, use POW's built in [port proxying](http://pow.cx/manual.html#section_2.1.4) functionality to proxy the requests from POW (port 80) to Apache (port 8888 by default).

The assumption is made that all your PHP projects will sit in the same root directory. This is necessary for VitualHost to work.

Usage
-----

`phpow help` lists all commands and options.
`phpow preview` previews the Apache configuration file to be written.
`phpow install` writes the Apache configuration file.
`phpow uninstall` deletes the Apache configuration file.

### Options

By default phpow will set up Apache to listen on port 8888, and serve projects from the folder `~/Sites/`.

Use the `--port PORT` and `--folder FOLDER` options to use a different port or folder respectively.


Installation
------------

**phpow* is distributed as a Ruby Gem.

```bash
gem install phpow
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
