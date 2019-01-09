namespace :simplecov do
  desc 'merge_results'
  task report_coverage: :environment do
    if Rails.env.test?
      require_relative '../../spec/support/simple_cov_helpers'
      SimpleCovHelpers.report_coverage
    end
  end
end
