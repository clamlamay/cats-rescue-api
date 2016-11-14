class DogsController < ApplicationController

	get '/dogs' do
		Dog.all.to_json
	end

	get '/dogs/:id' do
		# @id = params[:id]
		# Animal.find(@id).to_json

		@model = Dog.find(params[:id])
    	@model.to_json

	end
	
	post '/dogs' do
		@name = params[:name]
		@note = params[:note]
		@img = params[:img]
		
		@model = Dog.new
		@model.name = @name
		@model.note = @note
		@model.img = @img
		@model.save

		@model.to_json

		# @model = Animal.new
  #   	@model.name = params[:name]
  #   	@model.note = params[:note]
  #   	@model.image = params[:img]
  #   	@model.save
  #   	@model.to_json

	end

	patch '/dogs/:id' do
		@id = params[:id]

		@name = params[:name]
		@note = params[:note]
		@img = params[:img]
		
		@model = Dog.find(@id)

		@model.name = @name
		@model.note = @note
		@model.img = @img
		
		@model.save
		@model.to_json

		# @model = Animal.find(params[:id])
  #  		@model.name = params[:name]
  #  		@model.note = params[:note]
  #  		@model.image = params[:img]
  #   	@model.save
  #   	@model.to_json

	end	

	delete '/dogs/:id' do
		@model = Dog.find(params[:id])
    	@model.destroy
    	{:message => 'Your Dog with an id of ' + params[:id] + ' was adopted :)'}.to_json
	end

end