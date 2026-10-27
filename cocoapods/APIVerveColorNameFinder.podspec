Pod::Spec.new do |s|
  s.name             = 'APIVerveColorNameFinder'
  s.version          = '1.2.3'
  s.summary          = 'Color Name Finder matches any hex color code to its closest named CSS color.'
  s.description      = <<-'DESC'
Color Name Finder matches any hex color code to its closest named CSS color. Send a hex value to get the matching color name, RGB coordinates, and an exact match flag.

This iOS/macOS SDK provides a convenient way to access the Color Name Finder from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/colornamefinder?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/colornamefinder-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveColorNameFinder/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
