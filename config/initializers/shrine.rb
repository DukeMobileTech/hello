require 'shrine'
require 'shrine/storage/s3'
require 'shrine/storage/file_system'

s3_options = {
  region: ENV['AWS_REGION'],
  bucket: ENV['AWS_BUCKET'],
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "#{Rails.env}/cache", upload_options: { acl: 'public-read' }, **s3_options),
  store: Shrine::Storage::FileSystem.new('public', prefix: "uploads/#{Rails.env}/store")
}

# Shrine.plugin :default_storage, store: :new_store
Shrine.plugin :activerecord
Shrine.plugin :backgrounding
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :presign_endpoint
Shrine.plugin :upload_endpoint
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data

Shrine::Attacher.promote { |data| PromoteJob.perform_later(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_later(data) }
