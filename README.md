* [工作原則](http://redmine.growthschool.com/projects/class-02/wiki/%E5%B7%A5%E4%BD%9C%E5%8E%9F%E5%89%87)
* [Git branch 命名原則](http://redmine.growthschool.com/projects/class-02/wiki/Git_%E5%8D%94%E4%BD%9C%E6%B5%81%E7%A8%8B) （必看，乱命名者禁止贡献代码一天）
* [HTML CSS 排版規則](http://redmine.growthschool.com/projects/class-02/wiki/HTML_CSS_%E5%8D%94%E4%BD%9C%E8%A6%8F%E5%89%87)
* 开发功能必补齐 seed.rb
* 下午六点，请找主程确认你的功能可被合并
* 随时随地保持公德心，才是好队友

# 开发用帐号

* Admin :
* User :

# 其他

* 小组内成员请登陆 [README](http://redmine.growthschool.com/projects/team-2-5/issues)查看组长分配的项目任务

# seed.rb

```
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
```
