def logger
  Rails.logger
end

task common: :environment do
  if Rails.env.development?
    Rails.logger = ActiveSupport::Logger.new(STDOUT)
  elsif ENV['RAILS_LOG_TO_STDOUT'].present?
    Rails.logger = ActiveSupport::Logger.new(STDOUT)
    Rails.logger.formatter = ::Logger::Formatter.new
  else
    Rails.logger = ActiveSupport::Logger.new(Rails.root.join('log', 'tasks.log'), 5, 10 * 1024 * 1024)
    Rails.logger.formatter = ::Logger::Formatter.new
  end
end

require 'task_logging'
