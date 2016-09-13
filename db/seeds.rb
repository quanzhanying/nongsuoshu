# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "创建一个 admin 账户。"

User.create([email: "admin@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "true"])
puts "Admin account created."

create_users = for i in 1..3 do
                 User.create([email: "user#{i}@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "false", user_name: "user#{i}"])
end

User.create([email: "user4@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "false", user_name: "许昕"])

puts "4 Users' accounts created."

# 共5个用户，1个admin
Category.create!([name: "video", chs_name: "影视"])
Category.create!([name: "music", chs_name: "音乐"])
Category.create!([name: "writing", chs_name: "写作"])
Category.create!([name: "science", chs_name: "科学"])
Category.create!([name: "technology", chs_name: "技术"])
Category.create!([name: "Painting", chs_name: "绘画"])

puts "6 Categories created."

Plan.create!(name: "年费方案", price: 365, plan_date: 365)
