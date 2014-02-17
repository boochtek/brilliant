Brilliant Programming Language
==============================

This is an example of how to write an LLVM compiler in Ruby.
We're using Rattler as a parser.

It's currently the simplest compiler possible - it only allows
an integer as the program text, and returns that integer as the
exit code.


Getting Started
---------------

First install the prerequisites. On a Mac, just use Homebrew:

~~~ bash
brew bundle
~~~

On other OSes, take a look at the `Brewfile` to figure out what needs to be installed.

Once the prerequisites are installed, install the gems:

~~~ bash
bundle
~~~

Once that has finished, you can run the tests:

~~~ bash
rake
~~~


Copyright
---------

Copyright (c) 2014 Craig Buchek
Copyright (c) 2014 BoochTek, LLC

This software is licensed under the terms of the MIT License.
See LICENSE.txt for details.
