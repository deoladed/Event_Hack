require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
	context 'it give the title of the event' do
	  it "displays 'title'" do
      assign(:event, FactoryBot.create(:event))
	    render 
	    expect(rendered).to have_content '<%= @event.title %>'
	  end
	end


  it 'displays lyon' do

    assign(:user, FactoryBot.create(:user))
    assign(:event, FactoryBot.create(:event))

    render

    expect(rendered).to have_content 'Lyon'

  end

  # it 'displays regular user message' do

  #   assign(:user, FactoryBot.create(:user))

  #   render :template => “home/index.html.erb”

  #   expect(rendered).to match /pal/

  # end
end
