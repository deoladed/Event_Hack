require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
		@user = FactoryBot.create(:user)  	
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
    describe "#email" do
      # it {expect(@user).to validate_presence_of(:email)}
      # it {expect(@user).to validate_uniqueness_of(:email)}
      it {is_expected.to allow_value("cyber_snow@hotmail.com").for(:email)}
      it {is_expected.to allow_value("a@b.com").for(:email)}
      it {is_expected.to allow_value("cyber@snow.com").for(:email)}
      it {is_expected.to allow_value("cyber_snow@gmail.com").for(:email)}
      # it {is_expected.to_not allow_value("cyber_snowgmail.com").for(:email)}
      # it {is_expected.to_not allow_value("cyber_sno@gmailcom").for(:email)}
      # it {is_expected.to_not allow_value("cyber_snow@").for(:email)}
		end
  end

  context "associations" do
    it { expect(@user).to have_many(:attandances) }
    it { expect(@user).to have_many(:events).with_foreign_key(:admin_id) }
  end

end