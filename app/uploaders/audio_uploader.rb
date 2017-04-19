class AudioUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 10 * 1024 * 1024, message: 'is too large (max is 10 MB'
    validate_mime_type_inclusion %w(audio/mpeg audio/x-mpeg audio/mp3 audio/x-mp3 audio/mpeg3 audio/x-mpeg3 audio/mpg audio/x-mpg audio/x-mpegaudio audio/m4a audio/x-m4a)
  end
end
