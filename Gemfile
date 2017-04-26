source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Ruby version
ruby '2.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use pg as the database for Active Record
gem 'pg', '~> 0.18.4'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'paperclip', '~> 5.1.0'
gem 'inherited_resources', '~> 1.7'
gem 'activeadmin', '~> 1.0.0.pre5'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'annotate', '~> 2.7', '>= 2.7.1'
gem 'paperclip-av-transcoder', '~> 0.6.4'
gem 'aws-sdk', '~> 2.8', '>= 2.8.7'
gem 'devise', '~> 4.2'
gem 'devise_invitable', '~> 1.5', '>= 1.5.5'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'config', '~> 1.0'
gem 'rails-observers', github: 'rails/rails-observers'
gem 'actionpack-action_caching', '~> 1.1', '>= 1.1.1'
gem 'dalli', '~> 2.7', '>= 2.7.6'
gem 'connection_pool', '~> 2.2'
gem 'shrine', '~> 2.5'
gem 'image_processing', '~> 0.4.1'
gem 'mini_magick', '~> 4.7' # Imagemagick
gem 'sucker_punch', '~> 2.0', '>= 2.0.2'
gem 'fastimage', '~> 1.8', '>= 1.8.1'
gem 'roda', '~> 2.24'
gem 'jquery-fileupload-rails', '~> 0.4.7'
gem 'streamio-ffmpeg', '~> 3.0', '>= 3.0.2'
gem 'kaminari', github: 'kaminari/kaminari', branch: '0-17-stable'
gem 'exception_notification', '~> 4.2', '>= 4.2.1'
gem 'acts_as_list', '~> 0.7.2'
gem 'activeadmin_sortable_table', '~> 1.2'
#
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
