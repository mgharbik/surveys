# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### create administrator
#User.create(email: "admin@encuestas.com", user_type: "admin", password: "12345678", password_confirmation: "12345678")

Rapidfire::Role.create(name: "Iberia")
Rapidfire::Role.create(name: "Vueling")
Rapidfire::Role.create(name: "AirEuropa")
Rapidfire::Role.create(name: "AirNostrum")
Rapidfire::Role.create(name: "BintarCanarias")
Rapidfire::Role.create(name: "Ponair")
Rapidfire::Role.create(name: "Swiltoin")
Rapidfire::Role.create(name: "Inoer Helicopteros")
Rapidfire::Role.create(name: "Pasivos")
Rapidfire::Role.create(name: "Primer empleo")
Rapidfire::Role.create(name: "No ejerciendo")
Rapidfire::Role.create(name: "medios nacionales")
Rapidfire::Role.create(name: "medios internacionales")