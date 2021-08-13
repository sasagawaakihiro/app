# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8
categoryList = Category.create([
  {name: "チワワ"},
  {name: "ミニチュアシュナウザー"},
  {name: "パグ"}
])

PostContent.create([
  {name: '匿名花子', body: 'チワワについて語りませんか？' ,category_id: 1},
  {body: 'チワワはとても勇敢です。' ,category_id: 1},
  {name: '匿名花子', body: '私もそう思います。' ,category_id: 1}
])