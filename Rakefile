# could declare vars so that paths are not hard-coded!


task :default => [:start]

desc 'Starts app with thin server'
task :start do
  # exec replaces current process with command
  exec "thin -R config.ru start"
end


# database tasks
task :db => ["db:clean", "db:init", "db:populate"] do
  puts "Cleaning, initializing db schema and populating with rows"
end


namespace :db do

  desc 'Deletes the database'
  task :clean do
    File.delete('db/quotes.db') if File.exists?('db/quotes.db')
  end

  desc 'Creates the database schema: db is ready to be populated'
  task :init do
    touch 'db/quotes.db' unless File.exist?('db/quotes.db')
    ruby "scripts/init_db_schema.rb"
  end

  desc 'Polulates the database'
  task :populate do
    ruby "scripts/populate_db.rb"
  end

end
