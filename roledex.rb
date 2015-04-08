class Roledex < Contact
  attr_accessor :id, :contact

	def initialize
    @contacts = [] #Initialize the contacts array to nil
    @id = 1000     #Initialize the id variable to 1000
  end

  #Add Contact Function
  def add_contact(contact)
    contact.id = @id      #Assign the new contact info with a unique id to the array
    @contacts << contact  #Append the new entry to the next available position in the array
    puts "\n"
    puts "This contact's ID: #{contact.id}"
    puts "\n"
    @id += 1              #Increment the id counter up by 1 to keep the wheel's turnin
  end

  #Find Contact Function
  def find (contact_id)
    #Within the contacts array, do a search for the specified id
    contact = @contacts.find do |contacts| 
      contacts.id == contact_id
    end
    return contact #Return the contact entry found using the specified id given by the user
  end

  #Modify Contact Function
  def modify_contact(contact)
    print "Enter the id of the user you would like to modify: "
    puts contact.to_s
    print "Is this the correct contact y/n?: "
    user_choice = gets.chomp

    if user_choice.upcase() == "Y"
      puts "What would you like to change?: "
      puts "(1) First Name"
      puts "(2) Last Name"
      puts "(3) E-Mail"
      puts "(4) Notes"
      print "Enter your selection: "
      user_option = gets.chomp.to_i
      if user_option == 1
        puts "Enter the NEW first name: "
        contact.first_name = gets.chomp
      elsif user_option == 2
        puts "Enter the NEW last name: "
        contact.last_name = gets.chomp
      elsif user_option == 3
        puts "Enter the NEW E-Mail: "
        contact.email = gets.chomp
      elsif user_option == 4
        puts "Enter the NEW Notes: "
        contact.note = gets.chomp
      end
    elsif user_choice.upcase() == "N"
      main_menu
    end
    puts "Press ENTER to continue...."
  end

  #Display Contact Function
  def display_all_contacts(contact)
    puts "#{contact.id}: #{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.note}"
    puts "Press ENTER to continue...."
  end

  #Display the specified attribute function
  def display_info_by_attribute(contact)
    puts "Enter attribute you want to display"
    puts "(1) First name"
    puts "(2) Last name"
    puts "(3) Email"
    puts "(4) Note"
    att = gets.chomp.to_i
    print "Is this the correct contact y/n?: "
    user_choice = gets.chomp
    if user_choice.upcase() == 'Y'
      if att == 1
        puts "#{contact.id}: #{contact.first_name}"
      elsif att == 2
        puts "#{contact.id}: #{contact.last_name}"
      elsif att == 3
        puts "#{contact.id}: #{contact.email}"
      elsif att == 4
        puts "#{contact.id}: #{contact.note}"
      else
        puts "I'm sorry but there is no such attribute"
      end
    elsif user_choice.upcase() == 'N'
      main_menu
    end
    puts "Press ENTER to continue...."
  end

  def delete_contact(contact)
    print "Is this the correct contact y/n?: "
    user_choice = gets.chomp.to_s
    if user_choice.upcase() == 'Y'
      @contacts.delete(contact)
      @id -= 1
      puts "CONTACT -> REMOVED"
      puts "Press ENTER to continue...."
    elsif user_choice.upcase() == 'N'
      main_menu
    end
  end
end