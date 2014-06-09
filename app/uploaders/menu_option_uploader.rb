
class MenuOptionUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick 
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :pocket do
    process :resize_to_fill => [30,30]
  end 

end
