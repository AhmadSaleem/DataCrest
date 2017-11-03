# config/initializers/carrierwave.rb
require 'fog/aws'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
        aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
        region:                ENV["S3_REGION"],             # optional, defaults to 'us-east-1'
    }
    config.cache_dir = "uploads/tmp"
    config.fog_directory  = ENV["AWS_BUCKET"]                          # required
    config.fog_public     = false                                        # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
    config.storage = :fog
    config.fog_authenticated_url_expiration = 304800
  end
end
