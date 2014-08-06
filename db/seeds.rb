# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

oleg = User.create(first_name: "Oleg", last_name: "Perevertaylo", phone: "123456789", email: "lega@i.ua", password: "qwertyui", role: 2)

slon = Pet.create(pet_type: "slon")

Ad.create(title: "SLONA NASHEL!!!!111", city: "Lubotin", street: "Lenina", description: "ya nashel slona, kto poteryal?", user_id: oleg.id, content_id: slon.id, content_type: "Pet")

passport = Doc.create(doc_type: "passport", doc_code: "VN123456", first_name: "Labuh", last_name: "Labuhov")

Ad.create(title: "nashel passport", city: "Merefa", street: "Gagarina", description: "najden passport", user_id: oleg.id, content_id: passport.id, content_type: "Doc")

vasya = User.create(first_name: "Vasya", last_name: "Ivanov", phone: "987654321", email: "vasya@vasya.com", password: "iuytrrewq")

a_nomer = LicensePlate.create(number: "ax6776ae")

Ad.create(title: "Nashel nomer", city: "Chuguev", street: "Pushkinskaya", description: "a ya nomer nashe, no ya vam ego ne otdam", user_id: vasya.id, content_id: a_nomer.id, content_type: "LicensePlate")
