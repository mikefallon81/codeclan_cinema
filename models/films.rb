require_relative("../db/sql_runner")

attr_reader :id
attr_accessor :title, :price

class Film

def initialize(options)
  @id = options['id'].to_i if options ['id']
  @title = options['title']
  @price = options['price'].to_i
end


end
