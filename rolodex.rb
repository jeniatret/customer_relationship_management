#empty array where we will store the contacts 
class Rolodex
	#global variable (unique across all the rolodexes)
	@@ids = 1

	attr_accessor :contacts

	def initialize
		@contacts = []
	end
	
	#method that allows to add the contacts 
	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact  
		@@ids += 1
		contact
	end

	def print_contacts
		@contacts.each do |contact|
			puts contact
		end
	end

	def find_contact(id)
		@contacts.find do |contact|
			contact.id == id
		end
	end

	def delete_contact(id)
		contact = find_contact(id)
		@contacts.delete(contact)
	end
end
