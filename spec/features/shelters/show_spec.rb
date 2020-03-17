require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit /shelters/:id" do
    it "then I see that shelter's name, address, city, state, and zip." do 
      shelter_1 = Shelter.create(name: "Jordan's Shelter",
                                 address: "123 Fake St.",
                                 city: "Arvada", 
                                 state: "CO",
                                 zip: 80003)

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)

      within "#shelter-info" do
        expect(page).to have_content(shelter_1.address)
        expect(page).to have_content(shelter_1.city)
        expect(page).to have_content(shelter_1.state)
        expect(page).to have_content(shelter_1.zip)
      end
    end 
  end
end