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

puts phone_plus_one
