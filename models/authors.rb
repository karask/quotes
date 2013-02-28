# encoding: utf-8
class Author < Sequel::Model

  set_schema do
    primary_key :id
    varchar :name, :size => 50, :unique => true
  end

  create_table unless table_exists?

  if empty?
    create :name => 'Me'
    create :name => 'You'
  end  

end
