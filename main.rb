require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def contacts_map
  read_contacts.map { |contact| {contact[:name] => contact[:phone]} }
end

# puts contacts_map

def phone_plus_one
  read_contacts.select { |contact| contact[:phone].include? "+1" }
end

#puts phone_plus_one

def email_org
  read_contacts.select { |contact| contact[:email].include? ".org" }
end

#puts email_org

def count_plus_one
  phone_plus_one.reduce(0) do |count, contact|
    count +=1
  end
end

puts count_plus_one
