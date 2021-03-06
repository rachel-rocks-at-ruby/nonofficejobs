require 'faker'

f =  File.open("/home/vagrant/code/nonofficejobs/app/assets/images/Lucy2.jpg")


 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     location: Faker::Address.city,
     about:       Faker::Lorem.sentence,
     aspirations: Faker::Lorem.sentence,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.avatar = f
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
   )
 end
 brainstorms = Brainstorm.all

# Create Jobs
 50.times do
   Job.create!(
     name:         Faker::Lorem.word,
     description:  Faker::Lorem.sentence,
     category: categories.sample,
     user: users.sample
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
    )
  end
  posts = Post.all

  # Create Comments
  250.times do
    commentable = (posts + brainstorms).sample
    Comment.create!(
      user: users.sample,
      body: Faker::Lorem.paragraph,
      commentable_type: commentable.class.to_s,
      commentable_id: commentable.id
    )
  end
  comments = Comment.all

# Create Favorites
  250.times do
    favorable = (listings + brainstorms + mentors + jobs).sample
    Favorite.create!(
      user: users.sample,
      favorable_type: favorable.class.to_s,
      favorable_id: favorable.id
    )
  end
  comments = Favorite.all

# Create Friendships
  15.times do
    Friendship.create!(
      user: users.sample,
      friend: users.sample
    )
  end
  friends = Friendship.all


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
puts "#{Favorite.count} favorites created"
puts "#{Friendship.count} friendships created"