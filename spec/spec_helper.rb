RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  Dir["./spec/support/custom_matchers/**/*.rb"].each { |f| require f}

  def body_as_json
    json_str_to_hash(response.body)
  end

  def json_str_to_hash(str)
    JSON.parse(str).with_indifferent_access
  end

end
