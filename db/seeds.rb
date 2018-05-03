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
    images = Dir['/home/mracobes9/Ruby/MyBookSite/public/images/*'].select {|f| !File.directory? f}
    name = Faker::Book.title
    book_cover=File.open(images.sample)
    authors.sample.books.create(name: name, book_cover: book_cover)
end