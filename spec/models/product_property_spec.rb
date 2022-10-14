require 'rails_helper'

RSpec.describe ProductProperty, type: :model do
  let!(:new_product_property) { build(:product_property) }

  context "association" do
    it { should belong_to(:product) }
    it { should belong_to(:property) }
  end

  context "validations" do
    context "value" do
      it "should be in range" do
        expect(new_product_property.value.length).to be_between(1, 255)
      end
    end
  end
end
