# Create Locations and Armies. These shouldn't change after initial deploy

admin = User.find_or_initialize_by(email:  "stephen.r.lind@gmail.com")
admin.name = "Stephen Lind"
admin.password_digest = "$2a$10$PqFahHZF9YMvu4J5mMMnE.z0g9rYUsJ4dwRcF4dhyO7NpOXuOmS/O"
admin.admin = true
admin.activated = true
admin.activated_at = Time.zone.now
admin.save!

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
