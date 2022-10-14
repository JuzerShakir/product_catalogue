require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:new_user) { build(:user) }
  let!(:email_regexp) { /\A[^@\s]+@[^@\s]+\z/ }

  context "associations" do
    it { should have_many(:products) }
  end

  context "credentials" do
    context "email" do
      it 'should be unique' do
        expect(User.pluck(:email)).not_to include(new_user.email)
      end
      it 'should have valid format' do
        expect(new_user.email).to match(email_regexp)
      end
    end

    context "password" do
      it 'should be in range' do
        expect(new_user.password.length).to be_between(6, 128)
      end
    end
  end
end
