# Makespace Equipment Database

A database for Makespace equipment. On the web so we can check that the item we
want is available before leaving home.

## Getting started

The database itself is written using the [Ruby on
Rails](http://rubyonrails.org/) framework. Assuming you have the ruby gems
command available, rails can be installed with one command:

    $ gem install rails

Check out this repository to some convenient location:

    $ git clone https://github.com/Makespace/equipment-db.git
    $ cd equipment-db

Rails ships with a tool called `bundle` which can be used to automatically
fetch the dependencies for the database:

    $ bundle install

Now create the database schema:

    $ rake db:migrate

By default, for development, the rails framework makes use of a sqlite database
under `db/development.sqlite3`. The development server can be started with the
`rails` command:

    $ rails server

You can now visit your brand new equipment database on
[localhost:3000](http://localhost:3000).

## Contributing

If you want to contribute to the project please send a pull request or raise an
issue via the guthub issue system. If you want to learn Ruby on Rails a good
resource is the [rails tutorial
e-book](http://ruby.railstutorial.org/chapters/beginning#top) which is
available online.

See the hacking guide (`doc/HACKING.md`) for more details.

## License

Copyright (C) 2012 Philip Cowans and Rich Wareham

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
