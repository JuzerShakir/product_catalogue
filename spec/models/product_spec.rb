require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:new_product) { build(:product) }

  context "association" do
    it { should belong_to(:user) }
    it { should have_many(:product_properties) }
    it { should have_many(:properties) }
  end

  context "validations" do
    context "name" do
      it "should be present" do
        expect(new_product.name).to_not be_empty
      end

      it "should be unique" do
        expect(Product.pluck(:name)).not_to include(new_product.name)
      end

      it "should be in range" do
        expect(new_product.name.length).to be_between(1, 1024)
      end
    end

    context "upc" do
      it "should be unique" do
        expect(Product.pluck(:upc)).not_to include(new_product.upc)
      end

      it "should be in range" do
        expect([10, 12, 13]).to include(new_product.upc.length)
      end

      it "should be numerical" do
        expect(new_product.upc.match?(/\A\d+\z/)).to be_truthy
      end
    end

  end

  context "available_on" do
    it "should be set in future" do
      expect(new_product.available_on.future?).to be_truthy
    end
  end


end
