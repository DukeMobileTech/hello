require 'image_processing/mini_magick'
# Image uploader class - does validation, processing
class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :remove_attachment
  plugin :pretty_location
  plugin :processing
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :store_dimensions
  plugin :versions

  Attacher.validate do
    validate_mime_type_inclusion %w(image/jpeg image/png image/jpg image/gif)
    validate_max_size 5.megabytes, message: 'is too large (max is 5 MB)'
  end

  process(:store) do |io, _context|
    medium = resize_to_limit!(io.download, 300, 300, &:auto_orient)
    thumb = resize_to_limit!(io.download, 100, 100, &:auto_orient)
    { original: io, medium: medium, thumb: thumb }
  end
end
