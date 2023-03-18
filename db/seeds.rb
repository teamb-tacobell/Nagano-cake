#Admin.create!(
#   email: 'admin@admin',
#   password: 'tacobell'
#)

Customer.create!(
   last_name: '鈴木',
   first_name: '太郎',
   last_name_kana: 'スズキ',
   first_name_kana: 'タロウ',
   postcode: '1500041',
   residence: '東京都渋谷区神南1丁目19−11 パークウェースクエア2 4階',
   phone_number: '0368694700',
   email: 'hoge@example.com',
   encrypted_password: '000000'
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
