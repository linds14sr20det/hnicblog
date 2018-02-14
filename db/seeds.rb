# Create some users These shouldn't change after initial deploy

admin = User.create!(
    email:  "stephen.r.lind@gmail.com",
    name: "Stephen Lind",
    password_digest: "$2a$10$OTvrczPu1h5zpo8.b61peOm6hHNyvu9aji3R1rKCVoR/JhCpPwXee", #password
    activated: true,
    activated_at: Time.zone.now,
)

Role.create!(role: 2, user: admin)

judge = User.create!(
    email:  "judge@gmail.com",
    name: "Sylvester Stallone",
    password_digest: "$2a$10$OTvrczPu1h5zpo8.b61peOm6hHNyvu9aji3R1rKCVoR/JhCpPwXee", #password
    activated: true,
    activated_at: Time.zone.now,
    )

Role.create!(role: 1, user: judge)

submitter = User.create!(
    email:  "frank@rjc.com",
    name: "Frank Cavalier",
    password_digest: "$2a$10$OTvrczPu1h5zpo8.b61peOm6hHNyvu9aji3R1rKCVoR/JhCpPwXee", #password
    activated: true,
    activated_at: Time.zone.now,
)

Role.create!(role: 0, user: submitter)

# Create a bunch of test accounts

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end
#
# users = User.order(:created_at).take(6)
