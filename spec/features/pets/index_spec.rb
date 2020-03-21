require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit /pets" do
    it "then I see each pet's image, name, age, sex, and it's shelter in the system" do 
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

      visit "/pets"

      within "#pet-#{luna.id}" do 
        expect(page).to have_css("img[src*='#{luna.image}']")
        expect(page).to have_content(luna.name)
        expect(page).to have_content(luna.age)
        expect(page).to have_content(luna.sex)
        expect(page).to have_content(luna.shelter.name)
      end

      within "#pet-#{nova.id}" do 
        expect(page).to have_css("img[src*='#{nova.image}']")
        expect(page).to have_content(nova.name)
        expect(page).to have_content(nova.age)
        expect(page).to have_content(nova.sex)
        expect(page).to have_content(nova.shelter.name)
      end 

      within "#pet-#{roomba.id}" do 
        expect(page).to have_css("img[src*='#{roomba.image}']")
        expect(page).to have_content(roomba.name)
        expect(page).to have_content(roomba.age)
        expect(page).to have_content(roomba.sex)
        expect(page).to have_content(roomba.shelter.name)
      end
    end 

    it "then I see a link to Edit Pet with every pet that allows editing pet info." do 
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

      visit "/pets"

      within "#pet-#{luna.id}" do 
        expect(page).to have_link("Update Pet")
      end

      within "#pet-#{nova.id}" do 
        expect(page).to have_link("Update Pet")
      end 

      within "#pet-#{roomba.id}" do 
        expect(page).to have_link("Update Pet")
        click_on "Update Pet"
      end

      fill_in :image, with: "http://cdn.akc.org/content/article-body-image/golden_retriever_puppy_sleeping_dog_pictures.jpg"
      fill_in :name, with: "Triangle"
      fill_in :description, with: "Acute dog!"
      fill_in :age, with: "4"
      fill_in :sex, with: "Female"
      click_on "Submit"

      expect(page).to have_css("img[src*='http://cdn.akc.org/content/article-body-image/golden_retriever_puppy_sleeping_dog_pictures.jpg']")
      expect(page).to have_content("TRIANGLE'S")
      expect(page).to have_content("Acute dog!")
      expect(page).to have_content("4")
      expect(page).to have_content("Female")
    end 
  end
end