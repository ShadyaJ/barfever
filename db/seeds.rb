require 'CSV'

puts "Destroy users"
User.destroy_all

puts "Destroy bars"
Bar.destroy_all

puts "Create users"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Bars Lausanne_users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = User.new
  t.first_name = row['First Name']
  t.last_name = row['Last Name']
  t.status = row['status']
  t.nickname = row['Nickname']
  t.email = row['email']
  t.phone_number = row['Phone Number']
  t.password = "123456"
  t.save!
end


puts "Create bars"

csv_text_bars = File.read(Rails.root.join('lib', 'seeds', 'Bars Lausanne_bars.csv'))
csv_bars = CSV.parse(csv_text_bars, :headers => true, :encoding => 'ISO-8859-1')
csv_bars.each do |row|
  t = Bar.new
  t.name = row['name']
  t.category = row['category']
  puts "#{t.category}"
  t.description = row['description']
  t.price = row['price']
  t.address_street = row['street']
  t.address_zipcode = row['zipcode']
  t.address_city = row['city']
  # need to add photos later when we have cloudinary
  t.user = User.where(status: "I own the party!").sample
  t.save!
  puts "Create #{t.name} - #{t.category}"
end


event_1 = Event.create!(category: "Promotion", description: "Super promotion in all stuff to drink, buy one get one free",
  name: "buy 1 get 1 free", price: "50%", date: "24.03.2021", bar_id: "2")


