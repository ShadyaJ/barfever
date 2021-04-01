puts "Destroy users"
User.destroy_all

puts "Destroy reviews"
Review.destroy_all

puts "Destroy bar_musics"
BarMusic.destroy_all

puts "Destroy musics"
Music.destroy_all

puts "Destroy bars"
Bar.destroy_all

puts "Destroy events"
Event.destroy_all



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
  t.photo_url_1 = row['Photo']
  t.bar = Bar.find_by(name: row['Bar'])
  # need to add photos later when we have cloudinary
  t.save!
  puts "Create #{t.name} - #{t.category}"
end

puts "Create musics"

csv_text_musics = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_musics.csv'))
csv_musics = CSV.parse(csv_text_musics, :headers => true, :encoding => 'ISO-8859-1')
csv_musics.each do |row|
  t = Music.new
  t.name = row['music_style']
  # need to add photos later when we have cloudinary
  t.save!
end

puts "Create bar_musics"

csv_text_bar_musics = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_bar_musics.csv'))
csv_bar_musics = CSV.parse(csv_text_bar_musics, :headers => true, :encoding => 'ISO-8859-1')
csv_bar_musics.each do |row|
  t = BarMusic.new
  t.music = Music.find_by(name: row['music_style'])
  t.bar = Bar.find_by(name: row['bar'])
  # need to add photos later when we have cloudinary
  puts "Create #{row['music_style']} - #{row['bar']}"
  t.save!
end


puts "Create reviews"

csv_text_reviews = File.read(Rails.root.join('lib', 'seeds', 'Bars_Lausanne_reviews.csv'))
csv_reviews = CSV.parse(csv_text_reviews, :headers => true, :encoding => 'ISO-8859-1')
csv_reviews.each do |row|
  t = Review.new
  t.bar = Bar.find_by(name: row['name'])
  puts t.bar.name
  t.review_experience = row['review_experience']
  t.review_drink = row['review_drink']
  t.review_music = row['review_music']
  t.user = User.first
  # need to add photos later when we have cloudinary
  puts "Create #{row['name']} - #{row['review_experience']}, #{row['review_drink']}, #{row['review_music']}"
  t.save!
end
















