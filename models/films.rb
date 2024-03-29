require_relative("../db/sql_runner")


class Film

  attr_reader :id
  attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i if options ['id']
  @title = options['title']
  @price = options['price'].to_i
end

def save()
  sql = "INSERT INTO films (title, price)
  VALUES ($1, $2)
  RETURNING id;"
  values = [@title, @price]
  films = SqlRunner.run(sql, values).first
  @id = films['id'].to_i
end

def update()
  sql = "UPDATE films SET (title, price) = ($1, $2)
        WHERE id = $3;"
  values = [@title, @price, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE * FROM films WHERE id = $1;"
  values = [@id]
  SqlRunner.run(sql, values)
end


def cust_booked_for_film()
  sql = "SELECT customers.* FROM customers
        INNER JOIN tickets
        ON tickets.cust_id = customers.id
        WHERE film_id = $1;"
  values = [@id]
  customers = SqlRunner.run(sql, values)
  results = customers.map {|customer| Customer.new(customer)}
  return results
end

  def find_film_price
    sql = "SELECT price FROM films
    WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return @price
  end

  def tickets_sold_for_film
    return cust_booked_for_film.size
  end


def self.all()
  sql = "SELECT * FROM films;"
  films = SqlRunner.run(sql)
  result = films.map{|film| Film.new(film)}
  return result
end

def self.delete_all()
  sql = "DELETE FROM films;"
  values = []
  SqlRunner.run(sql, values)
end


end
