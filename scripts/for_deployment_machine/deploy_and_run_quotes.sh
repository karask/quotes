
cd quotes; thin stop; cd ..

rm -rf -I quotes

git clone --depth 1 https://karask@bitbucket.org/karask/quotes.git

cd quotes

bundle install

thin -d -R config.ru start

