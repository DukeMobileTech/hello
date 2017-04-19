class DocumentUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 12 * 1024 * 1024, message: 'is too large (max is 12 MB'
    validate_mime_type_inclusion %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/zip)
  end
end
