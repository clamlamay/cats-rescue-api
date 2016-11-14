
require 'sinatra/base'

# controllers
require './controllers/application_controller'
require './controllers/cats_controller'
require './controllers/dogs_controller'


# models
require './models/cats'
require './models/dogs'

map('/') { run ApplicationController }
map('/animals') { run CatsController }
map('/') { run DogsController }


#before/after filter
before '/*' do 
	puts "Route log:"
	puts request.host
	puts params
	puts request.path
end

after '/*' do 
	puts "Completed Route Log:"
	puts reponse.body
	puts response.status
end



