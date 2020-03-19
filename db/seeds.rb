# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Jordan's Shelter",
                           address: "123 Fake St.",
                           city: "Arvada", 
                           state: "CO",
                           zip: 80003)

shelter_2 = Shelter.create(name: "Hilary's Shelter",
                           address: "321 Real Rd.",
                           city: "Denver", 
                           state: "CO",
                           zip: 80301)

shelter_3 = Shelter.create(name: "Hiljo's Shelter",
                           address: "311 Realfake Ave.",
                           city: "Arvada", 
                           state: "CO",
                           zip: 80003)

luna = Pet.create(name: "Luna",
                  age: "5",
                  sex: "Female",
                  status: "Adoptable",
                  image: "http://cdn.akc.org/content/article-body-image/norwegianelkhoundpuppy_dog_pictures.jpg",
                  shelter: shelter_1)

nova = Pet.create(name: "Nova",
                  age: "10",
                  sex: "Female",
                  status: "Adoptable",
                  image: "http://cdn.akc.org/content/article-body-image/border_collie_dog_pictures_.jpg",
                  shelter: shelter_1)

roomba = Pet.create(name: "Roomba",
                    age: "7",
                    sex: "Male",
                    status: "Not Adoptable",
                    image: "http://cdn.akc.org/content/article-body-image/basset_hound_dog_pictures_.jpg",
                    shelter: shelter_2)