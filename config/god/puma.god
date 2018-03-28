RAILS_ROOT = File.expand_path(File.dirname(__FILE__) + '/../../')

God.watch do |w|
  w.name = 'puma'
  w.group = 'rails'

  w.env = {
    'RAILS_ROOT' => RAILS_ROOT,
    'RAILS_ENV' => ENV['RAILS_ENV'] || 'development',
    'RACK_ENV' => ENV['RACK_ENV'] || 'development'
  }

  w.start = "cd #{RAILS_ROOT} && bundle exec puma -C #{RAILS_ROOT}/config/puma/#{w.env['RAILS_ENV']}.rb --daemon"
  w.stop = "cd #{RAILS_ROOT} && bundle exec pumactl -S #{RAILS_ROOT}/tmp/pids/puma.state -F #{RAILS_ROOT}/config/puma/#{w.env['RAILS_ENV']}.rb stop"
  w.restart = "cd #{RAILS_ROOT} && bundle exec pumactl -S #{RAILS_ROOT}/tmp/pids/puma.state -F #{RAILS_ROOT}/config/puma/#{w.env['RAILS_ENV']}.rb restart"

  w.pid_file = File.join(RAILS_ROOT, 'tmp/pids/puma.pid')

  w.keepalive
end
