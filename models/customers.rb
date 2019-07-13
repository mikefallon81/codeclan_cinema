require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

def initialize (options)
  @id = options['id'].to_i if options ['id']
  @name = options['name']
  @funds = options['funds'].to_i
end

def save()
  sql = "INSERT INTO customers (name, funds)
  VALUES ($1, $2)
  RETURNING id"
  values = [@name, @funds]
  customers = SqlRunner.run(sql, values).first
  @id = customers['id'].to_i
end

def self.all()
  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
  result = customers.map{|customer| Customer.new(customer)}
  return result
end


def self.delete_all
  sql = "DELETE FROM customers"
  values = []
  SqlRunner.run(sql, values)
end


end
