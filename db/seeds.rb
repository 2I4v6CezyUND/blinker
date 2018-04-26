# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
ford = Make.create(name: "Ford")
f150 = Model.create(name: "F150", make: ford)
f150XL = ModelVariant.create(name: "XL", model: f150)
vehicle = Vehicle.create(description: "Its superb!", model_variant: f150XL)
