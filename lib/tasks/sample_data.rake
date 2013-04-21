namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    create_admin
    create_users
  end
end

def create_admin
  admin = User.create!(name:     'admin',
                       email:    'admin@example.com',
                       password: 'foobar',
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
end

def create_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end