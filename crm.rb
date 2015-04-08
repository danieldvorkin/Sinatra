require 'sinatra'
require_relative 'contact'
require_relative 'roledex'

get '/' do
	@crm_app_name = "Daniel's CRM"
	erb :index
end

get '/contacts' do
	@crm_app_name = "Daniel's CRM"
	@contacts = []
  	@contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")
  	@contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  	@contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder")
	erb :contacts
end