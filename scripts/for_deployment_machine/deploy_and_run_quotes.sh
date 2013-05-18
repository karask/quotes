
cd quotes; thin stop; cd ..

rm -rf -I quotes

git clone --depth 1 https://karask@bitbucket.org/karask/quotes.git

cd quotes

# add sqlite build configuration for when bundler installs gem
mkdir .bundle
echo "BUNDLE_BUILD__SQLITE3: --with-opt-include=/home/karask/local/lib/sqlite-autoconf-3071602/  --with-opt-lib=/home/karask/local/lib/sqlite-autoconf-3071602/.libs  --with-cflags='-O3 -DSQLITE_ENABLE_ICU' --with-cppflags=`icu-config --cppflags` --with-ldflags=`icu-config --ldflags`" > .bundle/config

bundle install

thin -d -R config.ru start

