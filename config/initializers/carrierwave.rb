require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],       
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],                        
    :region                 => ENV['AWS_REGION'],
  }
  config.fog_directory        = ENV['AWS_BUCKET']                
  config.fog_attributes       = {'Cache-Control'=>'max-age=315576000'} 
  config.fog_s3_access_policy = :public_read
  config.fog_host             = "#{ENV['AWS_ASSET_URL']}/#{ENV['AWS_BUCKET']}"
  config.storage        = Rails.env.production? ? :fog : :file 
end
