namespace :db do
   desc "Testing populator"
   task :seed => :environment do
    require 'faker'


    User.destroy_all
      user = User.new(
        email: 'test@example.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

    FoodPlace.destroy_all

    30.times do
      food_place = FoodPlace.new
      food_place.name = Faker::Company.name
      food_place.time = Faker::Number.number(2)
      food_place.phone_number = Faker::PhoneNumber.phone_number
      food_place.address1 = Faker::Address.street_address
      food_place.address2 = Faker::Address.secondary_address
      food_place.city = Faker::Address.city
      food_place.state = Faker::Address.state
      food_place.created_at = Time.now
      food_place.updated_at = Time.now
      food_place.user_id = user.id
      food_place.photo = File.open(Dir.glob(File.join(Rails.root, 'Images/Restaurants', '*')).sample)
      food_place.save
     
    end
    
    FoodPlace.all.each do |food_place|
      10.times do
        print "hola"  
        menu_option = MenuOption.new
        menu_option.food_place_id = food_place.id
        menu_option.photo = File.open(Dir.glob(File.join(Rails.root, 'Images/Options', '*')).sample)
        menu_option.name = Faker::Company.name
        menu_option.price = Faker::Number.number(2)
        menu_option.save
      end  
    end

   end 
end    

