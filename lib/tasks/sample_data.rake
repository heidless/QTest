namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(name: "grafter",
                         email: "lockhart.r@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@lockhartarts.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      title = Faker::Lorem.sentence(5)
      due_date = Date.tomorrow
      due_date = due_date + 1.month
      users.each { |user| user.todos.create!(title: title, content: content, due_date: due_date) }
    end
  end
end