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