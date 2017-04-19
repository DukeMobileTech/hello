require 'streamio-ffmpeg'
# Video uploader class - adds metadata
class VideoUploader < Shrine
  plugin :add_metadata
  plugin :processing
  plugin :versions
  plugin :delete_raw
  plugin :determine_mime_type
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers

  add_metadata do |io, _context|
    movie = FFMPEG::Movie.new(io.path)
    { 'duration'   => movie.duration,
      'bitrate'    => movie.bitrate,
      'resolution' => movie.resolution,
      'frame_rate' => movie.frame_rate }
  end
  metadata_method :duration, :bitrate, :resolution, :frame_rate

  process(:store) do |io, _context|
    mov        = io.download
    video      = Tempfile.new(['video', '.mp4'], binmode: true)
    screenshot = Tempfile.new(['screenshot', '.jpg'], binmode: true)
    movie = FFMPEG::Movie.new(mov.path)
    movie.transcode(video.path)
    movie.screenshot(screenshot.path)
    mov.delete
    { video: video, screenshot: screenshot }
  end
end
