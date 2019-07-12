require_relative("../db/sql_runner")
require_relative("./films.rb")
require_relative("./tickets.rb")


class Ticket
  
  attr_reader :id
  attr_accessor :cust_id, :film_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @cust_id = options['cust_id']
  @film_id = options['film_id']
end




end
