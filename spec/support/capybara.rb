require 'selenium-webdriver'
require 'capybara/rspec'

Capybara.configure do |capybara_config|
  capybara_config.default_driver = :selenium_chrome
  capybara_config.default_max_wait_time = 15
end

Capybara.register_driver :selenium_chrome do |app|
  chrome_option_arg = ['headless', 'disable-gpu', 'window-size=1680,1050']
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: { args: chrome_option_arg }
    )
  )
end

Capybara.javascript_driver = :selenium_chrome
