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

def save()
  sql = "INSERT INTO tickets (cust_id, film_id)
        VALUES ($1, $2)
        RETURNING id"
  values = [@cust_id, @film_id]
  tickets = SqlRunner.run(sql, values).first
  @id = tickets['id'].to_i
end



end
