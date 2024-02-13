require 'rails_helper'

RSpec.describe Detail, type: :model do
  context "associations" do
    it "belongs to a person" do
      association = described_class.reflect_on_association(:person)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  context "validations" do
    before(:each) do
      @person = Person.create!(name: "John Doe")
    end

    it "is not valid without an email" do
      detail = Detail.new(email: nil, person_id: @person.id)
      expect(detail).to_not be_valid
    end

    it "is not valid invalid email format" do
      detail = Detail.new(email: 'adasd.com', person_id: @person.id)
      expect(detail).to_not be_valid
    end

    it "is valid with valid email format" do
      detail = Detail.new(email: "suman@gmail.com", person_id: @person.id)
      expect(detail).to be_valid
    end
  end
end