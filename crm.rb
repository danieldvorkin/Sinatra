require 'sinatra'
# require "sinatra/reloader"
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
	@crm_app_name = "Daniel's CRM"
	erb :index
end

get '/contacts' do
	@crm_app_name = "Daniel's CRM"
	erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "Daniel's CRM"
	erb :new_contact
end

post '/contacts' do
	@crm_app_name = "Daniel's CRM"
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts/delete' do
	@crm_app_name = "Daniel's CRM"
	erb :delete_contact
end

delete '/contacts/:id' do
	@crm_app_name = "Daniel's CRM"
	contact = $rolodex.find(params[:id].to_i)
	$rolodex.delete_contact(contact)
	redirect to ('/contacts')
end

get '/contacts/edit/:id' do
	@crm_app_name = "Daniel's CRM"
	@contact = $rolodex.find(params[:id].to_i)
	erb :new_contact
end

post '/contacts/:id' do
	@crm_app_name = "Daniel's CRM"
	contact = $rolodex.find(params[:id].to_i)
	contact.first_name = params[:first_name]
	contact.last_name = params[:last_name]
	contact.email = params[:email]
	contact.note = params[:note]
	redirect to ('/contacts')
end