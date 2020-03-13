# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create!(id: 1, name: 'admin')if Rails.env.development?
Role.create!(id: 2, name: 'customer')if Rails.env.development?
Role.create!(id: 3, name: 'employee')if Rails.env.development?


User.create!(username: 'Nicolasgenest', email: 'nicolas.genest@codeboxx.biz', company: 'Codeboxx1', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Nadyafortier', email: 'nadya.fortier@codeboxx.biz', company: 'Codeboxx2', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
User.create!(username: 'Martinchantal', email: 'martin.chantal@codeboxx.biz', company: 'Codeboxx3', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
User.create!(username: 'Mathieuhoude', email: 'mathieu.houde@codeboxx.biz', company: 'Codeboxx4', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
User.create!(username: 'Remigagnon', email: 'remi.gagnon@codeboxx.biz', company: 'Codeboxx5', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Mathieulefrancois', email: 'mathieu.lefrancois@codeboxx.biz', company: 'Codeboxx6', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Sergesavoie', email: 'serge.savoie@codeboxx.biz', company: 'Codeboxx7', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Davidboutin', email: 'david.boutin@codeboxx.biz', company: 'Codeboxx8', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Mathieulortie', email: 'mathieu.lortie@codeboxx.biz', company: 'Codeboxx9', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
User.create!(username: 'Thomascarrier', email: 'thomas.carrier@codeboxx.biz', company: 'Codeboxx10', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?

# 300.times do
#     Lead.create([{
#         name: Faker::Name.name,
#         businessname: Faker::Company.name,
#         email: Faker::Internet.email,
#         phone: Faker::PhoneNumber.phone_number,
#         projectname: Faker::FunnyName.name,
#         description: Faker::IndustrySegments.industry,
#         department: "Elevators",
#         message: Faker::Books::Lovecraft.paragraph,
#         attachment: Faker::File.extension,
#         date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#     }])
# end