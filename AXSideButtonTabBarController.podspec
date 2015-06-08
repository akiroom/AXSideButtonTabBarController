
Pod::Spec.new do |s|
  s.name             = "AXSideButtonTabBarController"
  s.version          = "0.1.1"
  s.summary          = "Simple Tab Bar Controller with Side Buttons."
  s.description      = <<-DESC
                       Simple Tab Bar Controller with Side Buttons.
                       * Side buttons
                       * Separators
                       DESC
  s.homepage         = "https://github.com/akiroom/AXSideButtonTabBarController"
s.screenshots     = "https://raw.github.com/akiroom/AXSideButtonTabBarController/master/Screenshots/ss0.png"
  s.license          = 'MIT'
  s.author           = { "Hiroki Akiyama" => "aki-hiroki@nifty.com" }
  s.source           = { :git => "https://github.com/akiroom/AXSideButtonTabBarController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/akiroom'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AXSideButtonTabBarController' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit'
end
