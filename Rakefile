# could declare vars so that paths are not hard-coded!


task :default => [:db]

task :db => ["db:clean", "db:init", "db:populate"] do
  puts "Cleaning, initializing db schema and populating with rows"
end

namespace :db do
  desc 'Creates the database schema: db is ready to be populated'
  task :init do
    touch 'db/quotes.db' unless File.exist?('db/quotes.db')
    ruby "scripts/init_db_schema.rb"
  end

  desc 'Polulates the database'
  task :populate do
    ruby "scripts/populate_db.rb"
  end

  desc 'Deletes the database'
  task :clean do
    File.delete('db/quotes.db')
  end
end
