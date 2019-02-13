require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @events" do
	    event = FactoryBot.create(:event)
	    get :index
	    expect(assigns(:events)).to eq([event])
 		end

    it "renders the index template" do
	    get :index
	    expect(response).to render_template("index")
    end
  end



  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "assigns @events" do
	    event = FactoryBot.create(:event)
	    get :show
	    expect(assigns(:events)).to eq([event])
 		end

 		it "renders the show template" do
   		 get :show
	    expect(response).to render_template("show")
  	end
  end



  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
	    get :new
      expect(response).to render_template("new")
  	end
  end


  describe "POST #create" do
    it "returns http success" do
      get :create
    # des tests
      expect(response).to have_http_status(:success)
    end

    context "with valid attributes" do
    it "creates a new event" do
      expect { 
        post :create, event: FactoryBot.attributes_for(:event)
      			 }.to change(Event,:count).by(1)
    end
    
    it "redirects to the new event" do
      post :create, event: FactoryBot.attributes_for(:event)
      response.should redirect_to Event.last
    end
  end
  
  context "with invalid attributes" do
    it "doest not create a new event" do
      expect { 
        post :create, params: { event: {title: 'invalid'} }
      }.to_not change(Event, :count)
    end
    
    it "re-renders the new method" do
      post :create, params: { event: {title: 'invalid'} }
      response.should render_template :new
    end
  end
 end
end
