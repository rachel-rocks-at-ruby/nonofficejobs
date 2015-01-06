require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

# Create Jobs
 15.times do
   Job.create!(
     name:         Faker::Lorem.word,
     description:  Faker::Lorem.sentence
   )
 end
 jobs = Job.all

# Create Posts
50.times do
  Post.create!(
    user: users.sample,
    job:  jobs.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
     # user: users.sample,   # we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

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
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save!

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
puts "#{Job.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"