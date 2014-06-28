require 'spec_helper'

describe FoodPlacesController do
  describe 'GET index' do
  	before do
  	  create :user
  	  create :food_place
  	end

  	it 'is success' do
      get :index
      expect(response).to be_success
  	end

  	specify 'food_places var is not empty' do
  	  get :index
  	  expect(assigns(:food_places)).to_not be_empty
  	end
  	
  	specify 'style var is not empty' do
  	  get :index 
  	  expect(assigns(:style)).to_not be_empty
  	end

  	context 'when the style parameter is provided' do
  	  specify 'style var is the parameter provided' do
  	    get :index, style: 'list' 
  	    expect(assigns(:style)).to eq 'list'
  	  end
  	end	
  	      	  
  	context 'when the style parameter is not provided' do
      specify 'style var is thumbnails' do
  	    get :index
  	    expect(assigns(:style)).to eq 'thumbnails'
  	  end       
  	end 

  	specify 'positions var is not empty' do
  	  get :index
  	  expect(assigns(:positions)).to_not be_empty
  	end
  end

  describe 'GET show' do
    before do
      create :user	
  	  create :food_place
  	end

  	it 'is success' do
      get :show, id: FoodPlace.last.id
      expect(response).to be_success
  	end
  end

  describe 'GET new' do
  	login_user

    before do
  	  create :food_place  
  	end

  	it 'is success' do
      get :new
      expect(response).to be_success
  	end

  	specify 'food_place var is not empty' do
  	 get :new
  	 expect(assigns(:food_place)).to be_a(FoodPlace)
  	end
  end

  describe 'POST create' do
    login_user

    it 'redirects to food place page' do
      post :create, food_place: attributes_for(:food_place)
      expect(response).to redirect_to food_place_url(FoodPlace.last.id)
    end  

  end

  describe 'GET edit' do
  	login_user

    context 'when a user tries to edit his food place' do
      
      before do
  	    create :food_place  
  	  end

  	  it 'allows the owner editing' do
       get :edit, id: FoodPlace.last.id
       expect(response).to render_template('edit')
  	  end 	
    end 

    context 'when a user tries to edit someone food_place' do
      before do
      	create :user
  	    create :food_place  
  	  end
  	  it 'avoid others user editing' do
       get :edit, id: FoodPlace.last.id
       expect(response).to redirect_to root_url 
  	  end 	
    end 
  end 	


  describe 'PUT update' do 
  	login_user

  	before do
  	  create :food_place  
  	end

  	it 'updates a food_place' do
      put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, email: Faker::Company.name)
      expect(response).to redirect_to food_place_url(FoodPlace.last.id)
  	end	

  end

  describe 'DELETE destroy' do 
  	login_user

  	before do
  	  create :food_place  
  	end
    it 'destroys the given food_place' do 
      delete :destroy, id: FoodPlace.last.id
      expect(response).to redirect_to food_places_url
    end  	
  end 	

end 
