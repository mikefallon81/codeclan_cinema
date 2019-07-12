require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require ('pry-byebug')

customer1 = Customer.new({'name' => 'Michael', 'funds' => '75'})
customer1.save



binding.pry
nil
