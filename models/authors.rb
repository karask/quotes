# encoding: utf-8
class Author < Sequel::Model
  one_to_many :quotes
end
