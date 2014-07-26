require 'spec_helper'

describe HomeController do

  describe 'GET index' do
    login_user

    before do
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
    
    specify 'trio_food_places var is not empty' do
      get :index
      expect(assigns(:trio_food_places)).to_not be_empty
    end
  end

end