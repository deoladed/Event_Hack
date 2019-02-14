require 'rails_helper'


describe "the event creation process", type: :feature do
	before :each do
		sign_in
	end

  it "signs me in" do
    expect(page).to have_content 'successfully'
  end

  it 'it doesnt create and event' do #car start_date pas modifiable et duration non mutiple
  	visit new_event_path
		puts page.body
  	# fill_in :event_start_date, with: Faker::Date.forward(23)
  	fill_in 'event_duration', with: 51
  	fill_in 'event_title', with: Faker::Hacker.say_something_smart
  	fill_in 'event_price', with: 100
  	fill_in 'event_location', with: 'Tuba'
  	fill_in 'event_description', with: Faker::Lorem.paragraph_by_chars(100)

  	click_button 'Creer'
  	expect(page).to have_content 'Erreur'
  end
 
  def sign_in
      user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
  end
end