Phpow
=====

Develop your legacy PHP applications utilizing POW's TLDs on Mac OS X.

Installation
------------

```bash
gem install phpow
```

Usage
-----

`phpow -h` for all commands and options.

### Configuration

By default phpow will set up apache to listen on port 8888, and serve projects from the folder `~/Sites`.

Use the `--port PORT` and `--folder FOLDER` options to use a different port/location.

POW
---

Set up a POW to portmap to your apache port. If you have the [powder](https://github.com/Rodreegez/powder) gem `powder portmap 8888` will do the trick.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
