require 'random_data'

Post.find_or_create_by!(
  title: "This is a unique title",
  body: "This is a very unique body"
)

post_id = Post.find_by(
  title: "This is a unique title",
  body: "This is a very unique body"
)

Comment.find_or_create_by!(
  post: post_id,
  body: "This is a unique comment"
)

# Create posts
50.times do
  Post.create!(
    title: RandomData.random_sentance,
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
