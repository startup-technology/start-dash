Resque.redis = ENV['REDIS_URL']
Resque.after_fork = proc { ActiveRecord::Base.establish_connection }
