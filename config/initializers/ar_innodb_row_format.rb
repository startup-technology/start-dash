ActiveSupport.on_load :active_record do
  module InnodbRowFormat
    def create_table(table_name, options = {})
      table_options = options.merge(options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC')
      super(table_name, table_options) do |td|
        yield td if block_given?
      end
    end
  end

  module ActiveRecord::ConnectionAdapters
    class AbstractMysqlAdapter
      prepend InnodbRowFormat
    end
  end
end
