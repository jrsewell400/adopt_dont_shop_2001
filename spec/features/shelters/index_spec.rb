require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit /shelters" do
    it "then I see the name of each shelter in the system." do 
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

      visit '/shelters'

      within "#shelter-#{shelter_1.id}" do 
        expect(page).to have_content(shelter_1.name)
      end

      within "#shelter-#{shelter_2.id}" do 
        expect(page).to have_content(shelter_2.name)
      end 

      within "#shelter-#{shelter_3.id}" do 
        expect(page).to have_content(shelter_3.name)
      end
    end 
  end
end