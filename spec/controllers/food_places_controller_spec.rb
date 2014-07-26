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
    
    context 'when the food place is created correctly' do
      it 'redirects to food place page' do
        binding
        post :create, food_place: attributes_for(:food_place)
        expect(response).to redirect_to food_place_url(FoodPlace.last.id)
        expect( subject.request.flash[:success] ).to_not be_nil
      end  
    end
    
    context 'when the food place is not created correctly' do
      it 'renders to new food place template' do
        post :create, food_place: {food_place: FoodPlace.new, name: "Taquitos"}
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:new)
      end  
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
  	  it 'avoids others user editing' do
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
    
    context 'when the menu option is updated correctly' do
  	  it 'updates the given food place' do
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, email: Faker::Internet.email)
        expect(response).to redirect_to food_place_url(FoodPlace.last)
  	  end
    end  	
    
    context 'when the food place is rated' do
      it 'updates the food place rating' do
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, stars: '5')
        expect(assigns(:stars)).to_not be_nil
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, stars: assigns(:stars))
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, times_rated: FoodPlace.last.times_rated + 1)
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, rating: FoodPlace.last.stars/FoodPlace.last.times_rated)

        expect(response).to redirect_to food_place_url(FoodPlace.last)
      end   
    end 

    context 'when the menu option is not updated correctly' do
      it 'renders the edit food place template' do
        put :update, id: FoodPlace.last.id ,food_place: attributes_for(:food_place, name: '')
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:edit)
      end
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
