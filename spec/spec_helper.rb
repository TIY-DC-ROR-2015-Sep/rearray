require "rspec"
require "rspec-given"

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.default_formatter = 'doc'
  config.color = true

  #config.order = :random
  #Kernel.srand = config.seed
end
