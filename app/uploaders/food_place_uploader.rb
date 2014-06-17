# Uploader for Food places' images
class FoodPlaceUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :processed do
    process resize_to_fill: [310, 170]
  end

  version :big do
    process resize_to_fill: [500, 300]
  end
end
