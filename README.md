Phpow
=====

Develop PHP applications using POW's TLDs on Mac OS X.

Wat?
----

[POW](http://pow.cx) and Apache are in an eternal battle for port 80. POW gives nice `.dev` domains that you want to use for every project, including php, so it wins.

*phpow* is a simple script that installs an Apache .conf file setting up a VirtualHost and Document root so you can dynamically map `project-name.dev` to your `~/Sites/project-folder/` php application.

To bridge the gap between POW and Apache, use POW's built in [port proxying](http://pow.cx/manual.html#section_2.1.4) functionality to proxy the requests to Apache.

The assumption is made that all your PHP projects will sit in the same root directory. This is necessary for VitualHost to work.


Installation
------------

```bash
gem install phpow
```

Usage
-----

`phpow -h` for all commands and options.

### Configuration

By default phpow will set up Apache to listen on port 8888, and serve projects from the folder `~/Sites/`.

Use the `--port PORT` and `--folder FOLDER` options to use a different port or folder respectively.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
