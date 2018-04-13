module TaskLogging
  def task(*args, &_block)
    Rake::Task.define_task(*args) do |task, task_args|
      if block_given?
        Rails.logger&.info "[#{task.name}] start"
        begin
          yield task, task_args
          Rails.logger&.info "[#{task.name}] finished"
        rescue StandardError => error
          Rails.logger&.error "[#{task.name}] failed : #{error.message}"
          raise error
        end
      end
    end
  end
end

# Override Rake::DSL#task to inject logging
extend TaskLogging
