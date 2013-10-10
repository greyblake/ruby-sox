RSpec::Matchers.define :have_rate do |expected_rate|
  match do |file_path|
    @file_path = file_path

    # Get rate of audio file using soxi tool:
    @actual_rate = (%x"soxi -r #{file_path}").to_i
    @actual_rate == expected_rate.to_i
  end

  failure_message_for_should do
    "expected #{@file_path} to have rate #{expected_rate} but it's #{@actual_rate}"
  end

  failure_message_for_should_not do
    "expected #{@file_path} to not have rate #{expected_rate}"
  end

  description do
    "have rate #{expected_rate}"
  end

end