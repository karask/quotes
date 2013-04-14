# encoding: utf-8
class Tag < Sequel::Model
  many_to_many :quotes
end
