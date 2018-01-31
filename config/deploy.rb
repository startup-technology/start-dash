# config valid only for current version of Capistrano
lock '3.9.0'

set :application, 'start-dash'
set :repo_url, 'git@github.com:startup-technology/start-dash.git'

# Default branch is :master
set :branch, ENV['BRANCH'] || 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/start_dash'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(.env config/database.yml)

# Default value for linked_dirs is []
set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_path, '/usr/local/rbenv'

set :bundle_jobs, 4

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'resque:restart'
before 'deploy:migrate', 'deploy:db_create'
namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within release_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
end
