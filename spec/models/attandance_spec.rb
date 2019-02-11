require 'rails_helper'

RSpec.describe Attandance, type: :model do

  before(:each) do 
		@attandance = FactoryBot.create(:attandance)  	
  end

  it "has a valid factory" do
    expect(build(:attandance)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@attandance).to be_a(Attandance)
    end
  end

  context "associations" do
    it { expect(@attandance).to belong_to(:user) }
    it { expect(@attandance).to belong_to(:event) }
  end

end