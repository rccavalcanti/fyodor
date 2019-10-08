# Fyodor

Convert your Amazon Kindle highlights, notes and bookmarks into markdown files.


## What is it about
This application parses `My Clippings.txt` from your Kindle and generates a markdown file for each book/document, in the format `#{Author} - #{Title}.md`. This way, your annotations on the books you read are conveniently stored and easily managed.

To read more about the motivation and what problem it tries to solve, [check this blog post](http://rafaelc.org/blog/export-all-your-kindle-highlights-and-notes/).


## Features

* Supports all the type of entries in your clippings file: highlights, notes, clips and bookmarks.
* Automatic removal of empty or duplicate entries (the clippings file can get a lot of those).
* Orders your entries by location/page on each book (the clippings file is ordered by time).
* Easily configurable for your language, allowing you to get all features and beautiful output.
* This software goes some length to be locale agnostic: basic parsing should work without configuration for any language. It should also work even if your clippings file has multiple locales.
* Bookmarks are printed together and notes are formatted differently, for better visualization.
* Output in a format that is clean and easy to edit/fiddle around: markdown.

This program is based on the clippings file generated by Kindle 2019, but should work with other models.


## Installation

The only dependencies are Ruby and the TOML gem:

```
$ gem install toml
```

Clone the repo:

```
$ git clone https://github.com/rccavalcanti/fyodor.git
```


## Configuration

If your Kindle is not in English, you should configure the application so it knows how your `My Clippings.txt` calls some things (e.g. highlights, pages, etc). This is easily done in `parser` section of the config file, replacing the default English values.

Note that basic parsing should still work without configuration, but you won't take advantage of many features, resulting in a dirtier output.

To configure the application, copy the sample config and edit it. It can be placed on the root of this directory or at `~/.config/fyodor.toml`.

```
$ cd fyodor
$ cp fyodor.toml{.sample,}
## or cp fyodor.toml.sample ~/.config/fyodor.toml
```

You can also set:
* Whether to print each entry time next to them. On `[output]`, set `time` to `true` or `false`.
* If the program should not save some books. Set them in `[[output.ignored]]`.


## Running

```
$ cd fyodor
$ ./fyodor CLIPPINGS_FILE [OUTPUT_DIR]
```

Or if you linked it to a directory in your PATH:
```
$ fyodor CLIPPINGS_FILE [OUTPUT_DIR]
```

Where:
* `CLIPPINGS_FILE` is the path for `My Clippings.txt`.
* `OUTPUT_DIR` is the directory to write the markdown files. If none supplied, it will be `fyodor_output` in the current directory.


## LICENSE

Released under [GNU GPL v3](LICENSE).

Copyright 2019 Rafael Cavalcanti <hi@rafaelc.org>
