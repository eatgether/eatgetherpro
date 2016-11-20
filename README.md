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
create_user = for i in 1..10 do
  User.create!([email: "#{i}@#{i}.com",password: "111111",password_confirmation: "111111",is_admin: true,
                gender: "men#{i}", nameNick: "神圣小可爱#{i}", nameChi: "XX#{i}", birthday: "2000.1.1#{i}", cellNum: "110#{i}",
                heightUser: "188cm#{i}", income: "$$#{i}",
                image: "http://img0.hao123.com/data/1_8ad30e464ae5dcdfe4b57570deef4fd4_510.#{i}"])
end
puts "10 User created."

create_post = for i in 1..10 do
  Post.create!([title: "约饭主题no.#{i}", description: "约饭详细信息#{i}", user_id: i,eat_venue: "星巴克",eat_day: "2016-11-19",image:"https://ooo.0o0.ooo/2016/11/16/582c6e89c1c45.jpeg"])
end
puts "10 posts created."
```
