RSpec::Matchers.define :have_channels do |expected_channels|
  match do |file_path|
    @file_path = file_path

    @actual_channels = (%x"soxi -c #{file_path}").to_i
    @actual_channels == expected_channels.to_i
  end

  failure_message_for_should do
    "expected #{@file_path} to have channels #{expected_channels} but it's #{@actual_channels}"
  end

  failure_message_for_should_not do
    "expected #{@file_path} to not have channels #{expected_channels}"
  end

  description do
    "have channels #{expected_channels}"
  end

end
