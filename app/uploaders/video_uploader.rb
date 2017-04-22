require 'streamio-ffmpeg'
# Transcodes non-mp4 files to mp4, creates screenshot
class VideoUploader < Shrine
  plugin :processing
  plugin :versions
  plugin :delete_raw
  plugin :determine_mime_type
  plugin :remove_attachment

  process(:store) do |io, _context|
    mov = io.download
    screenshot = Tempfile.new(['screenshot', '.jpg'], binmode: true)
    movie = FFMPEG::Movie.new(mov.path)
    movie.screenshot(screenshot.path, seek_time: 5, resolution: '320x240')
    if mov.path.split('.').last == 'mp4'
      mov.delete
      { video: io, screenshot: screenshot }
    else
      video = Tempfile.new(['video', '.mp4'], binmode: true)
      movie.transcode(video.path)
      mov.delete
      { video: video, screenshot: screenshot }
    end
  end
end
