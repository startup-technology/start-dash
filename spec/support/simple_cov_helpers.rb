require "simplecov"

class SimpleCovHelpers
  SKIPPED_FILES = %w()

  class << self
    def report_coverage(base_dir: './coverage_results')
      setup_coverage
      SimpleCov.start 'rails'
      new(base_dir: base_dir).merge_results
    end

    def setup_coverage
      check_coverage = ENV.fetch('SKIP_COVERAGE_CHECK', 'false') == 'false'
      SimpleCov.minimum_coverage(86) if check_coverage
      SimpleCov.merge_timeout(3600)

      SKIPPED_FILES.each do |file|
        SimpleCov.add_filter(file)
      end

      Dir.glob(File.join('.', 'app', '*')).each do |dir|
        SimpleCov.add_group File.basename(dir).humanize, dir
      end
    end
  end

  attr_reader :base_dir

  def initialize(base_dir:)
    @base_dir = base_dir
  end

  def all_results
    Dir["#{base_dir}/.resultset*.json"]
  end

  def merge_results
    results = all_results.map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      puts result.to_s
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end
