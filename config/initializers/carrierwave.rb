CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/images"
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION']
    }
    config.storage = :fog
    config.fog_public = true
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_attributes = { 'Cache-Control' => 'max-age=31536000' }
  end
end
