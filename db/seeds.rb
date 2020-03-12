# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'martin.chantal@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'mathieu.houde@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'remi.gagnon@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'mathieu.lefrancois@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'serge.savoie@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'david.boutin@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'mathieu.lortie@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?
User.create!(email: 'thomas.carrier@codeboxx.biz', password: 'password', password_confirmation: 'password', admin: true, role: "admin") if Rails.env.development?

300.times do
    Lead.create([{
        name: Faker::Name.name,
        businessname: Faker::Company.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        projectname: Faker::FunnyName.name,
        description: Faker::IndustrySegments.industry,
        department: "Elevators",
        message: Faker::Books::Lovecraft.paragraph,
        attachment: Faker::File.extension,
        date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
    }])
end