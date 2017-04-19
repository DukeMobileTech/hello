require 'fastimage'
require 'mime/types'

module PaperclipShrineSynchronization
  def self.included(model)
    model.before_save do
      Paperclip::AttachmentRegistry.each_definition do |klass, name, _options|
        write_shrine_data(name) if changes.key?(:"#{name}_file_name") && klass == self.class
      end
    end
  end

  def write_shrine_data(name)
    attachment = send(name)

    if attachment.size.present?
      data = attachment_to_shrine_data(attachment)

      if attachment.styles.any?
        data = { original: data }
        attachment.styles.each do |name, style|
          data[name] = style_to_shrine_data(style)
        end
      end

      write_attribute(:"#{name}_data", data.to_json)
    else
      write_attribute(:"#{name}_data", nil)
    end
  end

  private

  # If you'll be using a `:prefix` on your Shrine storage, or you're storing
  # files on the filesystem, make sure to subtract the appropriate part
  # from the path assigned to `:id`.
  def attachment_to_shrine_data(attachment)
    {
      storage: :store,
      id: attachment.path,
      metadata: {
        size: attachment.size,
        filename: attachment.original_filename,
        content_type: attachment.content_type
      }
    }
  end

  # If you'll be using a `:prefix` on your Shrine storage, or you're storing
  # files on the filesystem, make sure to subtract the appropriate part
  # from the path assigned to `:id`.
  def style_to_shrine_data(style)
    attachment = style.attachment
    path = attachment.path(style.name)
    url = attachment.url(style.name)
    file = attachment.instance_variable_get('@queued_for_write')[style.name]

    size   = file.size if file
    size ||= FastImage.new(url).content_length # OPTIONAL (makes an HTTP request)
    size ||= File.size(path) if File.exist?(path)
    filename = File.basename(path)
    mime_type = MIME::Types.type_for(path).first.to_s.presence

    {
      storage: :store,
      id: path,
      metadata: {
        size: size,
        filename: filename,
        mime_type: mime_type
      }
    }
  end
end
