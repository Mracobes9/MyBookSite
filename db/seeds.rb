# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
    name = Faker::Book.author.split(' ')[0]
    second_name = Faker::Book.author.split(' ')[1]
    middle_name = "Smith"
    Author.create(name: name, second_name: second_name, middle_name: middle_name)
end

99.times do |i|
    authors = Author.all
    byebug
    images = Dir['public/images/*'].select {|f| !File.directory? f}

    name = Faker::Book.title
    book_cover=File.open(images.sample)
    description = Faker::Lorem.paragraph(5)
    authors.sample.books.create(name: name, book_cover: book_cover, description: description)
end

30.times do |i|
    images = Dir['public/avatars/*'].select {|f| !File.directory? f}
    name = Faker::Name.name_with_middle.split(' ')[0]
    second_name = Faker::Name.name_with_middle.split(' ')[1]
    middle_name = Faker::Name.name_with_middle.split(' ')[2]
    email = Faker::Internet.email
    avatar = File.open(images.sample)
    admin=false

    if i==1
        email = "kac.kurilov@yandex.ru"
        admin =true
    end

    user=User.new(name: name, second_name: second_name, middle_name: middle_name, email: email, password: "080411", password_confirmation:"080411", avatar: avatar,admin: admin)
    user.skip_confirmation!
    user.save
end

100.times do |i|
    text = Faker::Lorem.sentence
    user_id = User.all.sample.id
    book_id = Book.all.sample.id
    is_moderate = true

    Comment.create(text: text, user_id: user_id, book_id:book_id, is_moderate:is_moderate)
end

100.times do |i|
    user_id = User.all.sample.id
    book_id = Book.all.sample.id

    FavoriteBook.create(user_id: user_id, book_id: book_id)
end
