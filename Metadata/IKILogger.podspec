Pod::Spec.new do |s|
  s.platforms = { :ios => "8.0", :osx => "10.11" }
  s.name         = "IKILogger"
  s.version      = "1.1.4"
  s.summary      = "Colorful, detailed logging output in Swift with support for Crashlytics logging."
  s.description  = <<-DESC
Provides DLog style debugging for Swift highlighted by colorful symbols.
DLog is a popular, enhanced debugging format that uses Objective-C macros
to print out additional information like line numbers and method names.
                   DESC
  s.homepage     = "https://github.com/ikiApps/IKILogger"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "ikiApps LLC" => "https://ikiApps.com" }
  s.source       = { :git => 'https://github.com/ikiApps/IKILogger.git', :tag => s.version.to_s }
  s.source_files  = "Sources", "IKILogger/*"
  s.exclude_files = "Sources/Exclude"
end
