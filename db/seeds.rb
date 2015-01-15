require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     avatar:   Faker::Avatar.image,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Create Cateogries
 20.times do
   Category.create!(
     title:  Faker::Lorem.word,
     user: users.sample
   )
 end
 categories = Category.all

# Create Listings
 20.times do
   Listing.create!(
     title:  Faker::Lorem.word,
     location: Faker::Address.city,
     description: Faker::Lorem.sentence,
     pay: Faker::Commerce.price,
     compensation: Faker::Lorem.sentence,
     user: users.sample,
     category: categories.sample
   )
 end
 listings = Listing.all

 # Create Brainstorms
 20.times do
   Brainstorm.create!(
     title:  Faker::Lorem.word,
     description: Faker::Lorem.sentence,
     user: users.sample,
     category: categories.sample
     #comment: comments.sample
   )
 end
 brainstorms = Brainstorm.all

# Create Jobs
 50.times do
   Job.create!(
     name:         Faker::Lorem.word,
     description:  Faker::Lorem.sentence,
     category: categories.sample
   )
 end
 jobs = Job.all

 # Create Mentors
 15.times do
   Mentor.create!(
     description: Faker::Lorem.sentence,
     user: users.sample,
     job: jobs.sample
   )
 end
 mentors = Mentor.all

  # Create Posts
  150.times do
    Post.create!(
      user: users.sample,
      job:  jobs.sample,
      title:  Faker::Lorem.sentence,
      body:   Faker::Lorem.paragraph,
      image:  Faker::Avatar.image
      #comment: comments.sample
    )
  end
  posts = Post.all

  # Create Comments
  250.times do
    Comment.create!(
      user: users.sample,
      body: Faker::Lorem.paragraph
    )
  end
  comments = Comment.all


 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!

#Create my account
 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'info@jackhuahua.com',
   password: 'helloworld'
 )
 user.skip_confirmation!
 user.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Mentor.count} mentors created"
puts "#{Category.count} categories created"
puts "#{Listing.count} listings created"
puts "#{Brainstorm.count} brainstorms created"
puts "#{Job.count} jobs created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"