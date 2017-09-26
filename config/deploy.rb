# config valid only for current version of Capistrano
lock '3.9.1'

set :application, 'hello'
set :repo_url, 'git@github.com:kodvinci/hello.git'
set :use_sudo, false
set :deploy_via, :copy
set :pty, false
set :format, :pretty
set :keep_releases, 5
set :linked_files, %w[config/database.yml config/secrets.yml config/local_env.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads]
set :bundle_binstubs, nil

set :rvm_custom_path, '/usr/share/rvm' # System-wide RVM

namespace :deploy do
  desc 'Restart Application'
  task :restart do
    desc 'restart phusion passenger'
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, current_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
