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

require "csv"
CSV.foreach("import/condensed_book.csv") do |row|
  pb_date =
    begin
      Date.parse(row[9])
    rescue
      nil
    end
  Book.create(

    old_book_id: row[0],
    created_at: row[1],
    updated_at: row[2],
    title: row[3],
    author_name: row[4],
    cover_image_link: row[5],
    introduction: row[6],
    content: row[7],
    is_free: Random.new(1),
    is_editor_choice: Random.new(1),
    subtitle: row[8],
    published_date: pb_date,
    rating_from_ma: row[11]

  )
end

puts "books create."

# 共5个用户，1个admin
Category.create!([name: "writing", chs_name: "励志"])
Category.create!([name: "science", chs_name: "经济"])
Category.create!([name: "technology", chs_name: "技能"])
Category.create!([name: "Painting", chs_name: "个人成长"])

puts "6 Categories created."

Plan.create!(name: "年费方案", price: 365, plan_date: 365)
