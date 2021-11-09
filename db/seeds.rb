# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

count = 0       #starting counting
designs = 200   # designs == 200 this is the condition for our loop when to stop

count = 0       # counting or starting our loop

designs.times do  #this designs == to 200 the above number 
    system('clear')   # clearing system to make it look nice
    puts "Seeding Designs data"   
    puts "-------------------"
    count += 1              #just adding one number to our loop
    puts "#{count/designs.to_f*100}%"  # this is how we show the percentage when looding
    Design.create(created_at: (0..30).to_a.sample.days.ago, design_url: "https://loremflickr.com/320/240?random={(0...999).to_sample}", title: Faker::Movie.title, 
    description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))
    #creating new design, ..., flicker website, we want it to give us random pics
    # using faker to give fake title fake description 
end

puts "-------------------"
puts "Design Data: 100%"
puts "Data Successfully Seeded"
puts "-------------------"


# count = 0 
# designs = 10

# count = 0

# designs.times do 
#     system('clear')
#     puts "Seeding Designs Data"
#     puts "-----------------"
#     count += 1
#     puts "#{count/designs.to_f*100}%"
#     Design.create(created_at: DateTime.yesterday, design_url: "https://loremflickr.com/320/240?random=#{(0...999).to_a.sample}", title: Faker::Movie.title, description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))
# end
# puts "-----------------"
# puts "Design Data: 100%"
# puts "Data Sucessfully Seeded!"
# puts "-----------------"