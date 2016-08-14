Pod::Spec.new do |s|

  s.platforms = { :ios => "9.0"}
  # s.platforms = { :ios => "9.0", :osx => "10.11" }

  s.name         = "IKILogger"
  s.version      = "1.0.0"
  s.summary      = "Colorful, detailed logging output in Swift with support for Crashlytics logging."

  s.description  = <<-DESC
Provides DLog style debugging for Swift using color output support from the XcodeColors plugin. See https://github.com/robbiehanson/XcodeColors.
DLog is a popular, enhanced debugging format that used Objective-C macros to print out additional information like line numbers and method names.
                   DESC

  s.homepage     = "https://github.com/ikiApps/IKILogger"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  # s.license      = { :type => 'MIT' }

  s.author             = { "ikiApps LLC" => "ikiApps@ikiApps.com" }

  s.source       = { :git => 'https://github.com/ikiApps/IKILogger.git', :tag => s.version.to_s }
  s.source_files  = "Sources", "IKILogger/*"
  s.exclude_files = "Sources/Exclude"

end
