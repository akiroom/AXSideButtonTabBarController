
Pod::Spec.new do |s|
  s.name             = "AXSideButtonTabBarController"
  s.version          = "0.1.0"
  s.summary          = "Tab Bar Controller with Side Buttons."
  s.description      = <<-DESC
                       Tab Bar Controller with Side Buttons.
                       * Enable to set side buttons.
                       DESC
  s.homepage         = "https://github.com/akiroom/AXSideButtonTabBarController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hiroki Akiyama" => "aki-hiroki@nifty.com" }
  s.source           = { :git => "https://github.com/akiroom/AXSideButtonTabBarController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/akiroom'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AXSideButtonTabBarController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
