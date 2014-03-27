# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### create administrator
User.create(email: "admin@encuestas.com", user_type: "admin", password: "12345678", password_confirmation: "12345678")

Role.create(name: "Iberia")
Role.create(name: "Vueling")
Role.create(name: "AirEuropa")
Role.create(name: "AirNostrum")
Role.create(name: "BintarCanarias")
Role.create(name: "Ponair")
Role.create(name: "Swiltoin")
Role.create(name: "Inoer Helicopteros")
Role.create(name: "Pasivos")
Role.create(name: "Primer empleo")
Role.create(name: "No ejerciendo")
Role.create(name: "medios nacionales")
Role.create(name: "medios internacionales")