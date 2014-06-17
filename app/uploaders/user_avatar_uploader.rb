# Uploader for Users' images
class UserAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :avatar do
    process resize_to_fill: [30, 30]
  end

  version :avatar_m do
    process resize_to_fill: [70, 70]
  end
end
