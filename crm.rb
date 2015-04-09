require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
	include DataMapper::Resource
	
	property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String

  def to_s
  	puts "First Name: #{@first_name}"
  	puts "Last Name: #{@last_name}"
  	puts "Email: #{@email}"
  	puts "Notes: #{@note}"
  	puts "\n"
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!

# require "sinatra/reloader"
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
	erb :index
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts' do
	erb :contacts
end

get '/contacts/delete' do
	erb :delete_contact
end

delete '/contacts/:id' do
	contact = $rolodex.find(params[:id].to_i)
	$rolodex.delete_contact(contact)
	redirect to ('/contacts')
end

get '/contacts/edit/:id' do
	@contact = $rolodex.find(params[:id].to_i)
	erb :new_contact
end

post '/contacts/:id' do
	contact = $rolodex.find(params[:id].to_i)
	contact.first_name = params[:first_name]
	contact.last_name = params[:last_name]
	contact.email = params[:email]
	contact.note = params[:note]
	redirect to ('/contacts')
end