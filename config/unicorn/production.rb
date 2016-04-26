# paths
app_path = '/var/www/my_app_name'
app_current_path = "#{app_path}/current"
app_shared_path = "#{app_path}/shared"

working_directory app_current_path
pid "#{app_shared_path}/tmp/pids/unicorn.pid"

# listen
listen "#{app_shared_path}/tmp/sockets/unicorn.sock"

# logging
stderr_path "#{app_shared_path}/log/unicorn.stderr.log"
stdout_path "#{app_shared_path}/log/unicorn.stdout.log"

# workers
worker_processes 3
timeout 60
preload_app true

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{app_current_path}/Gemfile"
end

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
