# Create some users These shouldn't change after initial deploy

User.create!(
    email:  "edmontononslaught@gmail.com",
    name: "Ward Kapach",
    password_digest: "$2a$10$OTvrczPu1h5zpo8.b61peOm6hHNyvu9aji3R1rKCVoR/JhCpPwXee", #password
    activated: true,
    activated_at: Time.zone.now
)

User.create!(
    email:  "stephen.r.lind@gmail.com",
    name: "Stephen Lind",
    password_digest: "$2a$10$OTvrczPu1h5zpo8.b61peOm6hHNyvu9aji3R1rKCVoR/JhCpPwXee", #password
    activated: true,
    activated_at: Time.zone.now
)
