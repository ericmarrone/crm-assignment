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
  def update(user_input, new_value)
    case user_input
    when 1 then self.first_name = new_value
    when 2 then self.last_name = new_value
    when 3 then self.first_name = new_value
    when 4 then self.note = new_value
    end
    return self
  end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name',  'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    # @@contacts.each do |contact|
    #   # a = contact.instance_variables
    #   if attribute == "first_name"
    #
    #   # case attribute
    #   # when "first_name"
    #   #   then
    #   # when "last_name" then
    #   # when "email" then
    #
    #   # if a.include?(attribute)
    #   #     use_attribute = attribute
    #
    #   end


      # if contact.instance_variable_get("@#{attribute}") == value
      # if contact.key == "first_name" && attribute_value ==
    #     self.first_name = new_value
    #   elsif user_input == "last_name"
    #     self.last_name = new_value
    #   elsif user_input == "email"
    #     self.email = new_value
    #   elsif user_input == "note"
    #     self.note = new_value
    #   end
    # #   if attribute == "first_name"
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
