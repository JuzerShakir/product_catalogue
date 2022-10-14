require 'rails_helper'

RSpec.describe Property, type: :model do
  let!(:new_property) { build(:property) }


  context "association" do
    it { should have_many(:product_properties) }
    it { should have_many(:products) }
  end

  context "validations" do
    context "name" do
      it "should be present" do
        expect(new_property.name).to_not be_empty
      end

      it "should be unique" do
        expect(Property.pluck(:name)).not_to include(new_property.name)
      end

      it "should be in range" do
        expect(new_property.name.length).to be_between(1, 255)
      end
    end
  end
end
