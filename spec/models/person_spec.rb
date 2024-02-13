require 'rails_helper'

RSpec.describe Person, type: :model do
  context "validations" do
    it "is not valid without a name" do
      person = Person.new(name: nil)
      expect(person).to_not be_valid
    end

    it "is not valid name length 1 char" do
      person = Person.new(name: 'A')
      expect(person).to_not be_valid
    end

    it "is not valid name length above 50 char" do
      name = "A" * 51
      person = Person.new(name: name)
      expect(person).to_not be_valid
    end

    it "is valid with name" do
      person = Person.new(name: "John Doe")
      expect(person).to be_valid
    end
  end
end