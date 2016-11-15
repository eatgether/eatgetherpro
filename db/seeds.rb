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
  User.create!([email: "#{i}@#{i}.com",password: "111111",password_confirmation: "111111",is_admin: true,
                gender: "men#{i}", nameNick: "神圣小可爱#{i}", nameChi: "XX#{i}", birthday: "2000.1.1#{i}", cellNum: "110#{i}",
                heightUser: "188cm#{i}", income: "$$#{i}",
                image: "http://img0.hao123.com/data/1_8ad30e464ae5dcdfe4b57570deef4fd4_510.#{i}"])
end
puts "10 User created."

create_post = for i in 1..10 do
  Post.create!([title: "约饭主题no.#{i}", description: "约饭详细信息#{i}", user_id: i, eatVenue: "约饭地点#{i}", eatDay: "2016-11-1#{i}",image:"https://pixabay.com/photo-173902#{i}/"])
end
puts "10 posts created."
