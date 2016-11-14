class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require

	set :views, File.dirname(__FILE__) + '/../views'
	set :public_folder, File.dirname(__FILE__) + '/../public'

	
	#enabling sessions
	# enable :sessions

	#also connect to our database

	register Sinatra::CrossOrigin

	ActiveRecord::Base.establish_connection(
		:adapter => 'mysql2',
		:database => 'cat_rescue'
	)

	require 'sinatra'
	require 'sinatra/cross_origin'

	set :allow_origin, :any
	set :allow_methods, [:get, :post, :patch, :delete]

	options "*" do
    	response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    	response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  	end

  	configure do
   	 enable :cross_origin
  	end


	enable :session

	not_found do
		{:message => "not found"}.to_json
	end

	get '/' do
		{:message => "home page"}.to_json
	end

end