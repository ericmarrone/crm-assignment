require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "\#\#\#\# CONTACTS 3000 - MAIN MENU \#\#\#\#"
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name:'
    first_name = gets.chomp

    print 'Enter Last Name:'
    last_name = gets.chomp

    print 'Enter email:'
    email = gets.chomp

    print 'Enter a note:'
    note = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )

  end

  def modify_existing_contact
    # puts Contact.all
    # Contact.all.each do |contact|
    #   puts contact.full_name
    # end
    puts "Enter contact ID to edit"
    user_id = gets.to_i
    # attributes = ["first_name", "last_name", "email", "note"]
    puts "Which attribute would you like to edit?"
    puts '[1] first_name'
    puts '[2] last_name'
    puts '[3] email'
    puts '[4] note'
    user_input = gets.to_i
    attributes = ["first_name", "last_name", "email", "note"]
    puts "Enter new value for #{attributes[ user_input - 1 ]}"
    new_value = gets.chomp
    contact_to_edit = Contact.find(user_id)
    case user_input
    when 1 then user_input = 'first_name'
    when 2 then user_input = 'last_name'
    when 3 then user_input = 'email'
    when 4 then user_input = 'note'
    end
    contact_to_edit.update_attribute(user_input, new_value)
    puts "Contact updated!"
  end

  def delete_contact
    puts "Enter contact ID to edit"
    user_id = gets.to_i
    contact_to_delete = Contact.find(user_id)
    contact_to_delete.delete
    puts "Contact deleted!"
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts "Enter what attribute you would like to search by:"
    puts '[1] first_name'
    puts '[2] last_name'
    puts '[3] email'
    puts '[4] note'
    user_input = gets.to_i
    # attributes = ["first_name", "last_name", "email", "note"]
    # attributes.map! {|k| instance_variable_get("@#{k}")}
    inst_var = nil
    case user_input
    when 1 then inst_var = "first_name"
    when 2 then inst_var = "last_name"
    when 3 then inst_var = "email"
    when 4 then inst_var = "notes"
    end
    puts "Enter search value:"
    search_value = gets.chomp.to_s
    search_return = Contact.find_by(inst_var, search_value)
    puts search_return.inspect

  end

end

# jerry = Contact.create("Jerry", "Seinfeld", "jerry@comedian.com", "Even Stevens")
# george = Contact.create("George", "Costanza", "george@yankees.com", "Cantstandya")
# kramer = Contact.create("Cosmo", "Kramer", "kramer@kramericaindustries.com", "These pretzels are making me thirsty!")
# elaine = Contact.create("Elaine", "Bennes", "elaine@pendant.com", "Spongeworthy")

contacts3000 = CRM.new("Contacts 3000")
contacts3000.main_menu





# jason = Contact.create("Jason", "Smith", "jason@jason.com", "I like food")
# # puts jason.inspect
# bob = Contact.create("Bob", "Cobb", "bob@bob.com", "PIZZA!")
# # puts bob.inspect
#
# # puts Contact.all.inspect
# # puts Contact.find(2).inspect
# # puts Contact.find_by
# # Contact.delete_all
# # puts  Contact.all.inspect
# # puts bob.full_name
#
# # puts Contact.all.inspect
# # bob.delete
# # puts Contact.all.inspect
#
# # bob.update
# p bob.inspect
# # p bob.instance_variable_get(:@first_name).class
# p bob.instance_variables.class

at_exit do
  ActiveRecord::Base.connection.close
end
