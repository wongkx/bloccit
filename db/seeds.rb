require 'random_data'

5.times do
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end


admin2 = User.create!(
    name: 'Admin User',
    email:    'admin2@example.com',
    password: 'helloworld',
    role:     'admin'
)
 
member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
)

moderator = User.create!(
    name:     'Moderator User',
    email:    'moderator@example.com',
    password: 'helloworld',
    role:     'moderator'
)

users = User.all

15.times do
    Topic.create!(
        name:  RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all

50.times do
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end



puts "Seed finished"
puts "#{User.count} users create"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"