# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "创建一个 admin 账户, admin创建 5 个项目，每个项目 3 个回报，每个回报 1 笔订单，每笔订单 1 条流水。
4 个 user 账户，每个user创建1个项目，每个项目3个回报，每个回报1笔订单，每笔订单1条流水。
共6 种分类。"

User.create([email: "admin@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "true"])
puts "Admin account created."

create_users = for i in 1..3 do
                 User.create([email: "user#{i}@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "false", user_name: "user#{i}"])
end

User.create([email: "user4@gmail.com", password: "111111", password_confirmation: "111111", is_admin: "false", user_name: "许昕"])

puts "4 Users' accounts created."


Book.create([title: "钢铁是怎样练成的", content: "作者奥斯特洛夫斯基是一个苏联红军中的骑兵，在1920年秋在苏联国内战争中的一场戰鬥中負重傷，23歲時全身癱瘓，24歲時雙目失明、脊椎硬化。但他的毅力驚人，凭着口述請人纪录寫成這部基于本人故事的小說。小说写成后被出版社多次退稿，后经朋友们的努力在《青年近卫军》杂志上从1932年到1934年分11期连载发表。小说受到评论界的冷遇，但得到了广大读者的追捧。1935年米·科利佐夫在苏联《真理报》上发表介绍奥斯特洛夫斯基的报道，造成全国轰动。同年10月，奥斯特洛夫斯基被授予国家级最高荣誉列宁勋章。在之后的两年中小说被用各种语言重印重版了五十次。"])

Book.create([title: "把时间当作朋友", content: "这本书从心智成长的角度来谈时间管理，指出时间管理是成功的关键所在。作者引述自己从事的职业中所遇到的事例，告诉我们：如何打开心智，如何运用心智来和时间做朋友，如何理解时间管理的意义，在时间管理上取得突破，进而用心智开启自己的人生成功之旅。这本书从心智成长的角度来谈时间管理，指出时间管理是成功的关键所在。作者引述自己从事的职业中所遇到的事例，告诉我们：如何打开心智，如何运用心智来和时间做朋友，如何理解时间管理的意义，在时间管理上取得突破，进而用心智开启自己的人生成功之旅。"])

Book.create([title: "原则", content: "原则是能够在相似场景下反复运用的一套概念，有别于具体问题的狭义回答。每个游戏的获胜者都有自己遵循的原则，生活也是如此。原则是应对自然或生活规律的种种方式。对原则理解越透彻，越能在生活中游刃有余。生活的不同方面也有各自的原则，例如滑雪有“滑雪原则”，做父母的有“父母原则”，管理有“管理原则，投资有“投资原则”等等，也存在支配一切，包罗万象的“生活原则”。当然每个人都有自己认为最有效的原则。"])

Book.create([title: "人人都能用英语", content: "有些知识，不仅要了解，还要深入了解。为了深入了解，不仅要学习，还要实践，更要反复试错，在成功中获得激励，在失败中汲取教训，路漫漫其修远，上下求索才可能修成正果。小到开车，大到创业，个中所需要的知识莫不如是。面对这样的知识，我们要了解。然而，有另外一种知识，往往还是格外重要的知识，在知道它的那一瞬间就可能开始发挥重大的作用，甚至，在知道它（What）的那一瞬间，它所有的重大作用全部都发挥完毕（至于Why和How，甚至可能在了解它的What那一瞬间早已经不言自明）。"])

Book.create([title: "精通比特币", content: "想要加入一场颠覆金融世界的技术革命吗？《精通比特币》会为你参与这个货币网络提供必备知识，引导你进入看似复杂的比特币世界。无论你是正在构建下一个杀手级应用、投资创业，还是单纯对技术好奇，这本实用的书都是你不可或缺的阅读材料。比特币，作为第一个成功的去中心化数字货币，尽管还处在起步阶段，却已经催生了数十亿美元的全球性经济体。它对任何具备相应知识和参与热情的人都是开放的。《精通比特币》会为您提供必要的知识，但请各位读者自备热情。"])


puts "books create."

# 共5个用户，1个admin
Category.create!([name: "video", chs_name: "影视"])
Category.create!([name: "music", chs_name: "音乐"])
Category.create!([name: "writing", chs_name: "写作"])
Category.create!([name: "science", chs_name: "科学"])
Category.create!([name: "technology", chs_name: "技术"])
Category.create!([name: "Painting", chs_name: "绘画"])

puts "6 Categories created."
