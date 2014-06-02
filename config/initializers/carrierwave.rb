require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],       
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],                        
    :region                 => ENV['AWS_REGION'],
  }

  config.cache_dir            = "#{Rails.root}/tmp/uploads"

  config.fog_directory        = ENV['AWS_BUCKET']                
  config.fog_attributes       = {'Cache-Control'=>'max-age=315576000'} 
  config.storage              = Rails.env.production? ? :fog : :file 
end
