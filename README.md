
# Requires
* installing rvm properly and as a function (rvm.io)
* gem install bundler  (or rubygems-bundler?)
* sudo apt-get install libicu-dev (we compile sqlite gem with ICU support)
* sudo apt-get uninstall libsqlite3.so (Uninstall existing shared library, if any)
* Need to download the src of sqlite3 to compile with ICU support (for greek collation)
* Assumes the src of sqlite3 is unzipped at ~/local/lib/sqlite-autoconf-3071602 (check deploy_and_run_quotes.sh)

# Installing for development
$ bundle install --without production

# Start
$ thin -R config.ru start

