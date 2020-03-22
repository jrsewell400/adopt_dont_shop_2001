require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :image}
    it {should validate_inclusion_of(:age).in_range(1..25)}
    it {should validate_numericality_of(:age).is_greater_than(0)}
  end

  describe "relationships" do 
    it {should belong_to :shelter}
  end

  describe "instance methods" do 
    it ".adoptable?" do 
      shelter_1 = Shelter.create(name: "Jordan's Shelter",
                                 address: "123 Fake St.",
                                 city: "Arvada", 
                                 state: "CO",
                                 zip: 80003)

      luna = Pet.create(name: "Luna",
                        age: "5",
                        sex: "Female",
                        status: true,
                        image: "http://cdn.akc.org/content/article-body-image/norwegianelkhoundpuppy_dog_pictures.jpg",
                        shelter: shelter_1)

      nova = Pet.create(name: "Nova",
                        age: "10",
                        sex: "Female",
                        status: false,
                        image: "http://cdn.akc.org/content/article-body-image/border_collie_dog_pictures_.jpg",
                        shelter: shelter_1)

      expect(nova.adoptable?).to eq("Pending Adoption")
      expect(luna.adoptable?).to eq("Adoptable")
    end
  end
end