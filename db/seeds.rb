# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Insert data in Administrators table
pw = BCrypt::Password.create('1234')
admin = Administrator.new(name_admin: "Mr. Wayne", email_admin: "bruce@waynecorp.com", password_digest: pw)
admin.save
