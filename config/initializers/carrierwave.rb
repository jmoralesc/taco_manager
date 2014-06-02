require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],       
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],                        
    :region                 => 'eu-west-1',                  
  }
  config.fog_directory  = 'tacomanager'                     
  config.fog_public     = false                                   
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} 
  config.storage        = Rails.env.production? ? :fog : :file 
end
