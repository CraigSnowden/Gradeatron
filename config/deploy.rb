# config valid only for Capistrano 3.2
lock '3.4'

set :application, 'Gradeatron'
set :repo_url, 'git@github.com:CraigSnowden/Gradeatron.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/srv/gradeatron/'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log bundle tmp/pids tmp/cache tmp/sockets tmp/puma public/assets}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, :exec, :pumactl, '-F', 'config/puma.rb', :start
      end
    end
  end
  before :start, 'rvm:hook'

  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, :exec, :pumactl, '-F', 'config/puma.rb', :stop
      end
    end
  end
  before :stop,  'rvm:hook'

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, :exec, :pumactl, '-F', 'config/puma.rb', :'phased-restart'
      end
    end
  end
  before :restart, 'rvm:hook'

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'tmp:cache:clear'
      end
    end
  end

end
