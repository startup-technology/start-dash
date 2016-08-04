require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task setup: :environment do
    ENV['TERM_CHILD'] ||= '1'
    ENV['QUEUE'] ||= '*'
    require 'resque'
    require 'resque-scheduler'
  end

  task setup_schedule: :setup do
    Resque.schedule = ActiveScheduler::ResqueWrapper.wrap(
      YAML.load_file("#{Rails.root}/config/resque_schedule.yml") || {}
    )
  end

  task scheduler: :setup_schedule
end
