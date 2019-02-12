require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do 
		@event = FactoryBot.create(:event)  
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end
    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date) }
      it {is_expected.to allow_value(1.day.from_now).for(:start_date)}
      it {is_expected.to allow_value(1.week.from_now).for(:start_date)}
      it {is_expected.to_not allow_value(1.day.ago).for(:start_date)}
      it {is_expected.to_not allow_value(1.week.ago).for(:start_date)}
		end
    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) }
      it { expect(@event).to validate_numericality_of(:price).is_greater_than(0) }
      it { expect(@event).to validate_numericality_of(:price).is_less_than(1001) }
      it {is_expected.to allow_value(1).for(:price)}
      it {is_expected.to allow_value(200).for(:price)}
      it {is_expected.to allow_value(1000).for(:price)}
      it {is_expected.to_not allow_value(0).for(:price)}

      it {is_expected.to_not allow_value(1001).for(:price)}
		end
    describe "#description" do
      it { expect(@event).to validate_presence_of(:description)}
      it { expect(@event).to validate_length_of(:description).is_at_least(20) }
      it { expect(@event).to validate_length_of(:description).is_at_most(1000) }
      it {is_expected.to allow_value('Salut cava cest moi oejwodjweo').for(:description)}
      it {is_expected.to_not allow_value('Salut').for(:description)}
      it {is_expected.to_not allow_value('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').for(:description)}
		end
    describe "title" do
      it { expect(@event).to validate_presence_of(:title) }
      it { expect(@event).to validate_length_of(:title).is_at_least(5) }
      it { expect(@event).to validate_length_of(:title).is_at_most(140) }
      it {is_expected.to allow_value('OUias ouais ouais').for(:title)}
      it {is_expected.to_not allow_value('abc').for(:title)}
      it {is_expected.to_not allow_value('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').for(:title)}
		end
		describe "duration" do
      it { expect(@event).to validate_presence_of(:duration) }
      it { expect(@event).to validate_numericality_of(:duration).is_greater_than(0) }
      it {is_expected.to allow_value(5).for(:duration)}
      it {is_expected.to allow_value(500).for(:duration)}
      it {is_expected.to allow_value(5000).for(:duration)}
      it {is_expected.to_not allow_value(0).for(:duration)}
      it {is_expected.to_not allow_value(-5).for(:duration)}
      it {is_expected.to_not allow_value(-56).for(:duration)}
      it {is_expected.to_not allow_value(77).for(:duration)}
		end
		describe "location" do
      it { expect(@event).to validate_presence_of(:location) }
		end
	end
	 #  context "public instance methods" do
  #   describe "in_future" do
  #     it { expect(@event).to respond_to(:in_future) }

  #     it "should tell if the event is in the future" do
		# 		event_2 = FactoryBot.create(:event, start_date: 1.day.ago)

  #       expect(@event.in_future).to eq(true)
  #       expect(event2.in_future).to eq(false)
  #     end
  #   end
  #   describe "mutiple_of_5" do
  #     it { expect(@event).to respond_to(:duration_is_a_multiple_of_5) }

  #     it "should tell if duration is a mutiple of 5" do
		# 		event_2 = FactoryBot.create(:event, duration: 7)

  #       expect(@event.duration_is_a_multiple_of_5).to eq(true)
  #       expect(event2.duration_is_a_multiple_of_5).to eq(false)
  #     end
  #   end
  # end

  context "associations" do
      it { expect(@event).to have_many(:attandances) }
      it { expect(@event).to belong_to(:admin).class_name("User") }
  end
end

