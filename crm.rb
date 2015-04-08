require 'sinatra'

get '/' do
	@crm_app_name = "Daniel's CRM"
	erb :index
end

get '/contacts' do
	@crm_app_name = "Daniel's CRM"
	erb :contacts
end