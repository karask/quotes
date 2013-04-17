# encoding: utf-8
class Tag < Sequel::Model
  many_to_many :quotes

  def increase_quote_count
    self.quote_count = self.quote_count + 1
    save_changes
  end

end
