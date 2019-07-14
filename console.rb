require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require ('pry-byebug')

Ticket.delete_all()
Film.delete_all
Customer.delete_all()


# Customer.save('Michael', 50)

customer1 = Customer.new({'name' => 'Michael', 'funds' => '75'})
customer1.save
customer2 = Customer.new({'name' => 'Paul', 'funds' => '50'})
customer2.save
customer3 = Customer.new({'name' => 'Will', 'funds' => '30'})
customer3.save
customer4 = Customer.new({'name' => 'Joe', 'funds' => '40'})
customer4.save



film1 = Film.new({'title' => 'Spiderman', 'price' => 7})
film1.save
film2 = Film.new({'title' => 'Deadpool 2', 'price' => 5})
film2.save
film3 = Film.new({'title' => 'The Departed', 'price' => 8})
film3.save

ticket1 = Ticket.new({'cust_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Ticket.new({'cust_id' => customer2.id, 'film_id' => film3.id})
ticket2.save
ticket3 = Ticket.new({'cust_id' => customer3.id, 'film_id' => film2.id})
ticket3.save
ticket4 = Ticket.new({'cust_id' => customer1.id, 'film_id' => film2.id})
ticket4.save
ticket5 = Ticket.new({'cust_id' => customer1.id, 'film_id' => film3.id})
ticket5.save


binding.pry
nil
