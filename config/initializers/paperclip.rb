require 'paperclip/media_type_spoof_detector'
module Paperclip
  # TODO: Eventually get rid of this initializer
  # Disables content spoof check
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
