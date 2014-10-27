3.times do
  u = User.create(email: Faker::Internet.email, password: 'password1',
        password_confirmation: 'password1', confirmed_at: Time.now)
end

100.times do
  w = Wiki.create( title: Faker::Lorem.sentence(3),
        content: Faker::Lorem.paragraph(5), user_id: User.all.sample.id )
end

main_user = User.create(email: "admin@mywiki.com", password: "password1",
              password_confirmation: "password1", confirmed_at: Time.now)

p "Congrats! Your database has been seeded."
p "You may use:"
p "user: #{main_user.email} and pass: passoword1 to log in. Enjoy!"