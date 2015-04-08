class Rolodex # controller

	attr_reader :contacts	

	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id #setter method
		@contacts << contact
		@id += 1
	end

	def find(contact_id)
		@contacts.find do |contact|
			contact.id == contact_id
		end
	end

	def delete_contact(contact)
			@contacts.delete(contact)
			# @contact.delete_if { |contact| contact.id == contact_id }
	end

end