require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require ('pry-byebug')

Ticket.delete_all()
Film.delete_all
Customer.delete_all()


customer1 = Customer.new({'name' => 'Michael', 'funds' => '75'})
customer1.save

film1 = Film.new({'title' => 'Spiderman', 'price' => '7.50'})
film1.save

ticket1 = Ticket.new({'cust_id' => customer1.id, 'film_id' => film1.id})
ticket1.save


binding.pry
nil
