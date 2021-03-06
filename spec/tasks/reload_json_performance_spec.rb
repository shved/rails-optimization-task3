require 'rails_helper'
require 'rspec-benchmark'

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
end

describe 'large data import' do
  it 'works under 1 minute' do
    expect do
      `rake "reload_json[fixtures/large.json]"`
    end.to perform_under(60).sec
  end
end
