if Settings.carrierwave.present?
  CarrierWave.configure do |config|
    if Settings.carrierwave.fog_credentials.present?
      config.fog_credentials = Settings.carrierwave.fog_credentials.to_h
      config.fog_directory = Settings.carrierwave.fog_directory
      config.fog_public = Settings.carrierwave.fog_public if Settings.carrierwave.fog_public.present?
      config.fog_attributes = Settings.carrierwave.fog_attributes.to_h if Settings.carrierwave.fog_attributes.present?
      config.asset_host = Settings.carrierwave.asset_host if Settings.carrierwave.asset_host.present?
    else
      config.storage = :file
      config.root = Rails.root.join('tmp')
      config.cache_dir = Rails.root.join('tmp', 'images')
    end
  end
end
