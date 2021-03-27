puts "Destroy users"
User.destroy_all

puts "Destroy bars"
Bar.destroy_all

puts "Create users"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_users.csv'))
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
  puts "Create #{t.first_name} - #{t.last_name}"
end


puts "Create bars"

csv_text_bars = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_bars.csv'))
csv_bars = CSV.parse(csv_text_bars, :headers => true, :encoding => 'ISO-8859-1')
csv_bars.each do |row|
  t = Bar.new
  t.name = row['name'].strip
  t.category = row['category']
  t.description = row['description']
  t.music_style = row['music_style']
  t.terrace =row['terrace']
  t.price = row['price']
  t.address_street = row['street']
  t.address_zipcode = row['zipcode']
  t.address_city = row['city']
  t.photo_url_1 = row['Photo 1']
  t.photo_url_2 = row['Photo 2']
  # need to add photos later when we have cloudinary
  t.user = User.where(status: "I own the party!").sample
  t.save!
  puts "Create #{t.name} - #{t.category}"
end

puts "Create events"

csv_text_events = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_events.csv'))
csv_events = CSV.parse(csv_text_events, :headers => true, :encoding => 'ISO-8859-1')
csv_events.each do |row|
  t = Event.new
  t.name = row['Name']
  t.category = row['Category']
  t.description = row['Description']
  t.price = row['Price'].to_i
  t.date = row['Date']
  t.bar = Bar.find_by(name: row['Bar'])
  # need to add photos later when we have cloudinary
  t.save!
  puts "Create #{t.name} - #{t.category}"
end
