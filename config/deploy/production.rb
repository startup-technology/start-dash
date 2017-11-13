set :stage, :production
set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'
set :deploy_to, '/var/www/start-dash'
set :linked_dirs, %w[log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle node_modules public/packs]
set :workers, '*' => 2

set :whenever_environment, :production
set :whenever_roles, :batch

role :app, %w[devuser@app1.start-dash.startup-technology.com]
role :web, %w[devuser@app1.start-dash.startup-technology.com]
role :db, %w[devuser@app1.start-dash.startup-technology.com]
role :batch, %w[devuser@app1.start-dash.startup-technology.com]
role :resque_worker, %w[devuser@app1.start-dash.startup-technology.com]
