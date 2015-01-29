
#for CRM code when it runs, it will be able to access rolode and contact file code
require_relative './rolodex.rb'
require_relative './contact.rb'
# require "pry"

class Crm
	attr_reader :name
	attr_accessor :rolodex

	def initialize(name) 
		@name = name
		#rolodex now stores the contacts 
		@rolodex = Rolodex.new
	end

#to make instance variable accessable outside of class is to write a method
#def name
#	@name 
#end 
#or u use attr_reader :name 

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts" 
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number"
	end

	def main_menu
		puts "Welcome to #{@name}"
		
		while true
			print_main_menu
			input = gets.chomp.to_i  # => 4
			choose_option(input)	
			return if input == 7
		end
	end

	def choose_option(option)
		case option 
		when 1
			add_contact
		when 2
			modify_contact
		when 3
			display_contacts
		when 4
			display_contact
		when 5
			display_attribute
		when 6
			delete_contact
		when 7 
			puts "Goodbye!"
			return 
		else 
			puts "Incorrect option, try again."
		end 
	end
	
	#option 1
	def add_contact
		puts ""
		puts "Provide Contact details"
		
		print "First name:"
		first_name = gets.chomp
		
		print "Last name: "
		last_name = gets.chomp
		
		print "Email: "
		email = gets.chomp
		
		print "Note: "
		note = gets.chomp

		new_contact = Contact.new(first_name, last_name, email, note)
		#put new_contact into rolodex
		@rolodex.add_contact(new_contact) 
	end

	#option 2
	def modify_contact 
	  puts "Choose what ID do you want to modify (eg. id put 1, 2 ...)"
		input = gets.chomp.to_i
		person = @rolodex.find_contact(input)

		puts "Indicate what do you want to modify, type either 'first_name', 'last_name', 'email' or 'note':"
		choice = gets.chomp
		case choice 
			when 'first_name'
				first_name = gets.chomp
				person.first_name = first_name
			when 'last_name'
				last_name = gets.chomp
				person.last_name = last_name	
			when 'email'
				email = gets.chomp
				person.email = email
			when 'note'
				note = gets.chomp
				person.note = note
		end
	end


	#option 3
	def display_contacts
		@rolodex.print_contacts
	end

	#option 4
	def display_contact
		puts "Chose a contact id number"
		input = gets.chomp.to_i
		result = @rolodex.find_contact(input)
		puts result
	end

	
	#option 5
	def display_attribute
		puts "Choose what you want to see: for id put 1, 2 ..."
		input_id = gets.chomp.to_i
		person = @rolodex.find_contact(input_id)

		puts "Indicate what do you want to see, type either 'first_name', 'last_name', 'email' or 'note':"
		input1 = gets.chomp
		case input1 
			when input1 = 'first_name'
				puts person.first_name
			when input1 = 'last_name'
				puts person.last_name
			when input1 = 'email'
				puts person.email
			when input1 = 'note'
				puts person.note
		end
	end


	#option 6
	def delete_contact
		puts "Choose a contact id that you want to delete"
		input = gets.chomp.to_i 
		@rolodex.delete_contact(input)
	end  


end

#instance of the variable (building plan=Class is CRM here ..... new = new building is build is bitmaker here)
# so bitmaker has CRM qualities 
crm = Crm.new("Bitmaker Labs CRM")
#call the method on bitmaker now so we run the main_menu
contact = Contact.new("Bill", "Gates", "bill@microsoft.com", "Curing malaria")
contact2 = Contact.new("Bob", "Gates", "bob@microsoft.com", "Curing malaria")
contact3 = Contact.new("Joe", "Gates", "joe@microsoft.com", "Curing malaria")


crm.rolodex.add_contact(contact)
crm.rolodex.add_contact(contact2)
crm.rolodex.add_contact(contact3)



crm.main_menu

#bitmaker.name

