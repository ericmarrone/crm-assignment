class Contact
  @@contacts = []
  @@id = 1
  # attr_reader :first_name, :last_name, :email, :note, :id
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def note
    @note
  end

  def id
    @id
  end

  def email
    @email
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    attributes = ["first_name", "last_name", "email", "note"]
    puts "Which attribute would you like to edit?"
    puts attributes
    user_input = gets.chomp
    puts "Enter new value for #{user_input}"
    new_value = gets.chomp
    if user_input = "first_name"
      self.first_name = new_value
    elsif user_input = "last_name"
      self.last_name = new_value
    elsif user_input = "email"
      self.email = new_value
    elsif user_input = "note"
      self.note = new_value
    end
    puts "Contact updated!"
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name',  'Betty' should return the first contact named Betty
  def self.find_by
    attributes = ["first_name", "last_name", "email", "note"]
    puts "Enter what attribue you would like to search by:"
    puts attributes
    attribute = gets.chomp
    puts "Enter attribute value:"
    attribute_value = gets.chomp
    #   if attribute == "first_name"
    #     first_name
    #   elsif attribute == "last_name"
    #     last_name
    #   elsif attribute == "email"
    #     email
    #   elsif attribute == "note"
    #     note
    #   end
    #       return contact.inspect
    #     else
    #       puts "Search not found"
    #       @@contacts.each do |contact|
    #
    #     end
    #   end
    # end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end
end
  # Feel free to add other methods here, if you need them.



jason = Contact.create("Jason", "Smith", "jason@jason.com", "I like food")
# puts jason.inspect
bob = Contact.create("Bob", "Cobb", "bob@bob.com", "PIZZA!")
# puts bob.inspect

# puts Contact.all.inspect
# puts Contact.find(2).inspect
# puts Contact.find_by
# Contact.delete_all
# puts  Contact.all.inspect
# puts bob.full_name

# puts Contact.all.inspect
# bob.delete
# puts Contact.all.inspect

bob.update
p bob.inspect
