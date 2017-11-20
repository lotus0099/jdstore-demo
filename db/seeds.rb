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
#     u.is_admin = true
#     u.save
#     puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
# else
#     puts 'Admin 已经建立过了，脚本跳过该步骤。'
# end
# Initialize Product
Category.create!(
    id: 2,
    name: '数码产品'
  )
  Category.create!(
      id: 3,
      name: '日用品'
    )
