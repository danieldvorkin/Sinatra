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
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
  )
  $rolodex.add_contact(contact)
  redirect to('/contacts')
end

get '/contacts' do
	@contacts = Contact.all
	erb :contacts
end

get '/contacts/:id' do
	@contacts = Contact.get(params[:id].to_i)
	if @contacts
		erb :contacts
	else
		raise Sinatra:NotFound
	end
end

get '/contacts/delete' do
	@contacts = Contact.get(params[:id].to_i)
	if @contacts
		erb :contacts
	else
		raise Sinatra:NotFound
	end
end

delete '/contacts/:id' do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.destroy
		redirect to '/contacts'
	else
		raise Sinatra:NotFound
	end
end

get '/contacts/edit/:id' do
	@contact = Contact.get(params[:id].to_i)
	erb :new_contact
end

post '/contacts/:id' do
	contact = Contact.get(params[:id].to_i)
	contact.first_name = params[:first_name]
	contact.last_name = params[:last_name]
	contact.email = params[:email]
	contact.note = params[:note]
	redirect to ('/contacts')
end