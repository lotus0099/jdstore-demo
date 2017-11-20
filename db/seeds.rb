# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if User.find_by(email: 'lvdeshi2011@163.com').nil?
#     u = User.new
#     u.email = 'lvdeshi2011@163.com'
#     u.password = '123456'
#     u.password_confirmation = '123456'
#     u.is_admin = tru
#     u.save
#     puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
# else
#     puts 'Admin 已经建立过了，脚本跳过该步骤。'
# end
# Initialize Product
if User.find_by(email: 'lvdeshi2011@163.com').nil?
    User.create!(
        email: 'lvdeshi2011@163.com',
        password: '111111',
        password_confirmation: '111111'
    )
    puts '創建一般用戶帳號 * 1'
else
    puts '已創建過此帳號，不重複新增。'
 end

    # 新增廣告  Intro #

   # 1
   Intro.create!(
     title: '生活甄选',
     content: '講究生活裡細微的美好，就是我們的選物精神。',
     link: '#'
   )

   # 2
   Intro.create!(
     title: '桌上風景',
     content: '實用與美學兼具，重新定義你的辦公日常。',
     link: '#'
   )

   # 3
   Intro.create!(
     title: '生活質感',
     content: '讓風格成為日常的一部分。',
     link: '#'
   )

   # 4
   Intro.create!(
     title: '經典單品',
     content: '從隨身物件展露你的獨到品味',
     link: '#'
   )

   puts '創建廣告*4'
