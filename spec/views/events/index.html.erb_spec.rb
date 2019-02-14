require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do
	context 'it give the title of the event' do
	  it "displays an even" do

	    render 	
	    expect(rendered).to have_content 'EVENTS IN LYON !'
	  end
	end
end