require 'rubygems'
require 'appium_lib'
require 'nodo'

class HappoController < Nodo::Core
  script <<~JS
    const HappoController = require('happo-e2e/controller');
    const controller = new HappoController();
  JS
  function :init, <<~JS
    async () => { return await controller.init(); }
  JS
  function :finish, <<~JS
    async () => { return await controller.finish(); }
  JS

  function :register_local_snapshot, <<~JS
    async (component, variant, target, screenshot) => {
      const buffer = Buffer.from(screenshot, 'base64');
      return await controller.registerLocalSnapshot({ component, variant, target, buffer });
    }
  JS

end

desired_caps = {
    'platformName': 'iOS',
    'platformVersion': '15.5',
    'deviceName': 'iPhone 13',
    'app': '../ios-test-app/build/Release-iphonesimulator/TestApp-iphonesimulator.app',
    'automationName': 'XCUITest',
}

happo_controller = HappoController.new
happo_controller.init
appium_driver = Appium::Driver.new({
    'caps' => desired_caps,
  }, true)
driver = appium_driver.start_driver
screenshot = driver.screenshot_as :base64
happo_controller.register_local_snapshot('Foo', 'Bar', 'iPhone 13', screenshot)
happo_controller.finish
driver.quit
