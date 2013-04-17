# encoding: utf-8
class Quote < Sequel::Model
  many_to_one :author
  many_to_many :tags

end
