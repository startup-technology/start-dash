RAILS_ROOT = File.expand_path(File.dirname(__FILE__) + '/../../')

God.watch do |w|
  w.name = 'resque'
  w.group = 'rails'

  w.env = {
    'RAILS_ROOT' => RAILS_ROOT,
    'RAILS_ENV' => ENV['RAILS_ENV'] || 'development',
    'RACK_ENV' => ENV['RACK_ENV'] || 'development'
  }

  w.start = "cd #{RAILS_ROOT} && bundle exec rails resque:work"

  w.keepalive
end
