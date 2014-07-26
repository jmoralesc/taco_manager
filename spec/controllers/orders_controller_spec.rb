require 'spec_helper'

describe OrdersController do
 
  describe 'GET index' do 
    context 'when a user logsin as user' do
      login_user
      before do
        create :food_place
        create :menu_option
        create :order
      end

      it 'is success' do
        get :index
        expect(response).to be_success
      end

      specify 'orders var is not empty' do
        get :index
        expect(assigns(:orders)).to_not be_empty
      end
    end

    context 'when a user logsin as admin' do
      login_admin
      before do
        create :food_place
        create :menu_option
        create :order
      end

      it 'is success' do
        get :index
        expect(response).to be_success
      end

      specify 'orders var is not empty' do
        get :index
        expect(assigns(:orders)).to_not be_empty
      end
    end


  end

  describe 'GET show' do
  	login_user

    before do
        create :food_place
        create :menu_option
        create :order
    end

    it 'is success' do
      get :show, id: Order.last.id
      expect(response).to be_success
    end

    context 'when a user tries to see his order' do
      
      before do
  	    create :food_place
        create :menu_option
        create :order
  	  end

  	  it 'should authorize' do
       get :show, id: Order.last.id
       expect(response).to render_template('show')
  	  end 	
    end 

    context 'when a user tries to see someone else order' do
      before do
      	create :user
  	    create :food_place
        create :menu_option
        create :order  
  	  end
  	  it 'should not authorize' do
       get :show, id: Order.last.id
       expect(response).to redirect_to root_url 
  	  end 	
    end 
  end

  describe 'GET new' do
    login_user

    before do
      create :user
      create :food_place
      create :menu_option
      create :order  
    end

    it 'is success' do
      get :new
      expect(response).to be_success
    end

    specify 'order var is not empty' do
     get :new
     expect(assigns(:order)).to be_a(Order)
    end
  end

  describe 'POST create' do
    login_user

    before do
      create :user
      create :food_place
      create :menu_option
      
    end

    context 'when the order is created correctly' do
      it 'redirecs to the order page' do
        invited = {id: [User.last.id]} 
        post :create, order: attributes_for(:order), invitedu: invited
        expect( subject.request.flash[:success] ).to_not be_nil
        expect(response).to redirect_to edit_order_url(Order.last.id)
      end
    end  
    
    context 'when the order is not created correctly' do
      it 'renders new order template' do
         invited = {id: [User.last.id]} 
        post :create, order: {order: Order.new, food_place_id: ''}, invitedu: invited
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:new)
      end
    end  

  end  

  describe 'GET edit' do
    login_user
    before do
      create :food_place
      create :menu_option
      create :order
    end

    it 'is success' do
      get :edit, id: Order.last.id
      expect(response).to be_success
    end

  end   

  describe 'PUT update' do 
    login_user

    before do
      create :food_place
      create :menu_option
      create :order 
      request.env['HTTP_REFERER'] = 'where_i_came_from' 
    end
     
    context 'when the menu option is updated correctly' do 
      it 'updates a order' do

        put :update, id: Order.last.id ,order: attributes_for(:order, food_place_id: FoodPlace.last.id)
        expect(assigns(:total)).to_not be_nil
        expect( subject.request.flash[:success] ).to_not be_nil
        expect(response).to redirect_to "where_i_came_from"
      end
    end
    
    context 'when the menu option is not updated correctly' do
      it 'renders the edit order template' do
        put :update, id: Order.last.id ,order: attributes_for(:order, food_place_id: '')
        expect( subject.request.flash[:error] ).to_not be_nil
        expect(response).to render_template(:edit)
      end   
    end   

  end

   describe 'DELETE destroy' do 
    login_user

    before do
      create :food_place
      create :menu_option
      create :order 
    end

    it 'destroys the given order' do 
      delete :destroy, id: Order.last.id
      expect(response).to redirect_to orders_url
    end   
  end   



end 
