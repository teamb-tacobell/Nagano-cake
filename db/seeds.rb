#Admin.create!(
#   email: 'admin@admin',
#   password: 'tacobell'
#)

Customer.create!(
   last_name: '鈴木',
   first_name: '一郎',
   last_name_kana: 'スズキ',
   first_name_kana: 'イチロウ',
   postcode: '0123456',
   residence: '東京都渋谷区神南一丁目19-11',
   phone_number: '01234567890',
   email: 'hoge10@hoge',
   password: '000000'
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
