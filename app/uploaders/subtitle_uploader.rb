class SubtitleUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 1 * 1024 * 1024, message: 'is too large (max is 1 MB'
    validate_mime_type_inclusion %w(text/vtt application/octet-stream text/x-pascal text/plain)
  end
end
