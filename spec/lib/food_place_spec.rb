require 'spec_helper'

require 'food_place'

describe FoodPlace do

  describe '#full_street_address' do
    context 'When the join off address, street,state and México is successful' do
      before do 
        subject.address1 = "Jesus Alcaraz #597"
        subject.city = "Colima"
        subject.state = "Colima"
      end   
      it 'returns the correct string' do
        expect(subject.full_street_address()).to eq 'Jesus Alcaraz #597, Colima, Colima, México'
      end
    end
  end 

end