ghost = Category.create(c_name: "Ghost")
witch = Category.create(c_name: "Witch")
monster = Category.create(c_name: "Monster")
stalker = Category.create(c_name: "Stalker")
night = Category.create(c_name: "Night")
children = Category.create(c_name: "Children")

user = User.create(name: "kage", email: "kage@mail.com", password: "kagekage")

30.times do
  Story.create(title: "記事", body: "Hello world!", user_id: 1, category_id: rand(1..6) )
end
