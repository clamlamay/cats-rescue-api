class CatsController < ApplicationController

	get '/cats' do
		Animal.all.to_json
	end

	get '/cats/:id' do
		# @id = params[:id]
		# Animal.find(@id).to_json

		@model = Animal.find(params[:id])
    	@model.to_json

	end
	
	post '/cats' do
		@name = params[:name]
		@note = params[:note]
		@img = params[:img]
		
		@model = Animal.new
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

	patch '/cats/:id' do
		@id = params[:id]

		@name = params[:name]
		@note = params[:note]
		@img = params[:img]
		
		@model = Animal.find(@id)

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

	delete '/cats/:id' do
		@model = Animal.find(params[:id])
    	@model.destroy
    	{:message => 'Your cat with an id of ' + params[:id] + ' was adopted :)'}.to_json
	end

end