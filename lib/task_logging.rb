module TaskLogging
  def task(*args, &_block)
    Rake::Task.define_task(*args) do |task|
      if block_given?
        Rails.logger.info "[#{task.name}] start"
        begin
          yield task
          Rails.logger.info "[#{task.name}] finished"
        rescue StandardError => error
          Rails.logger.info "[#{task.name}] failed"
          raise error
        end
      end
    end
  end
end

# Override Rake::DSL#task to inject logging
extend TaskLogging
