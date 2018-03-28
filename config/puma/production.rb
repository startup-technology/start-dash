app_path = '/var/www/start_dash'
app_shared_path = "#{app_path}/shared"

directory "#{app_path}/current"
rackup "#{app_path}/current/config.ru"
environment 'production'

bind "unix://#{app_shared_path}/tmp/sockets/puma.sock"

tag ''

pidfile "#{app_shared_path}/tmp/pids/puma.pid"
state_path "#{app_shared_path}/tmp/pids/puma.state"
stdout_redirect "#{app_shared_path}/log/puma_access.log", "#{app_shared_path}/log/puma_error.log", true

threads 0, 16
workers 0

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = ''
end
