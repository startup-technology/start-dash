Resque.redis = Settings.resque.redis
Resque.after_fork = proc { ActiveRecord::Base.establish_connection }
