require 'sinatra'
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

post '/contacts' do
	@crm_app_name = "Daniel's CRM"
	$rolodex.delete_contact(new_contact)
	redirect to ('/contacts')
end

get '/contacts/edit' do
	@crm_app_name = "Daniel's CRM"
	erb :edit_contact
end