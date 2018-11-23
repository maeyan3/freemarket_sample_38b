class ItemImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  CarrierWave.configure do |config|
    if Rails.env.development? || Rails.env.test?
      config.storage = :file
    elsif Rails.env.production?
      config.storage = :fog
    end
  end
  process :resize_to_fit => [300, 300]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
