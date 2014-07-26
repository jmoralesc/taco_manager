require 'spec_helper'

describe MenuOptionsController do
  login_user

  before do
  	  create :food_place	
      create :menu_option
  	end	

  describe 'GET show' do
  	    
    it 'is success' do
      get :show, food_place_id: FoodPlace.last.id, id: MenuOption.last.id
      expect(response).to be_success      
    end	
  end

  describe 'GET new' do

    it 'is success' do
      get :new, food_place_id: FoodPlace.last.id
      expect(response).to be_success
    end

    specify 'menu_option var is not empty' do
     get :new, food_place_id: FoodPlace.last.id
     expect(assigns(:menu_option)).to be_a(MenuOption)
    end
  end

  describe 'POST create' do

    context 'when the menu option is created correctly' do
       it 'redirects to food place page' do
        post :create,food_place_id: FoodPlace.last.id ,menu_option: attributes_for(:menu_option)
         expect( subject.request.flash[:success] ).to_not be_nil
        expect(response).to redirect_to food_place_url(FoodPlace.last.id)
      end  
    end  

    context 'when the menu option is not created correctly' do
       it 'renders the new menu option template' do
        post :create,food_place_id: FoodPlace.last.id ,menu_option: {menu_option: MenuOption.new, name: 'Taquitos'}
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:new)
      end  
    end 
  end

  describe 'GET edit' do
  	
    it 'is success' do
      get :edit, food_place_id: FoodPlace.last.id, id: MenuOption.last.id
      expect(response).to be_success      
    end	
  end		

  describe 'PUT update' do 
    context 'when the menu option is updated correctly' do
      it 'updates the given menu_option' do
        put :update, food_place_id: FoodPlace.last.id ,id: MenuOption.last.id, menu_option: attributes_for(:menu_option, name: Faker::Company.name)
        expect(response).to redirect_to food_place_menu_option_url(FoodPlace.last, MenuOption.last)
      end
    end
    context 'when the menu option is not updated correctly' do
      it 'renders the edit menu option template' do
        put :update, food_place_id: FoodPlace.last.id ,id: MenuOption.last.id, menu_option: attributes_for(:menu_option, name: '')
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:edit)
      end
    end   
  end

  describe 'DELETE destroy' do 

    it 'destroys the given menu_option' do 
      delete :destroy, food_place_id: FoodPlace.last.id, id: MenuOption.last.id
      expect(response).to redirect_to food_place_url(FoodPlace.last)
    end   
  end   
	
end