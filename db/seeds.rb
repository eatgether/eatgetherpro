# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

create_user = for i in 1..10 do
  User.create!([email: "#{i}@#{i}.com",password: "111111",password_confirmation: "111111",is_admin: true])
end
puts "10 User created."

create_post = for i in 1..10 do
  Post.create!([title: "约饭主题no.#{i}", description: "约饭详细信息#{i}", user_id: i])
end
puts "10 posts created."
