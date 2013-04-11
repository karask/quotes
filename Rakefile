# could declare vars so that paths are not hard-coded!


task :default => [:init_db]

desc 'Create the database schema: db is ready to be populated'
task :init_db do
    touch 'db/quotes.db' unless File.exist?('db/quotes.db')
    ruby "scripts/init_db_schema.rb ../db/quotes.db"
end
