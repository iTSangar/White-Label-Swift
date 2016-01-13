Pod::Spec.new do |s|
  s.name     = 'WhiteLabel'
  s.version  = '0.1.1'
  s.license  = 'MIT'
  s.summary  = 'WhiteLabel is a Swift interface for the White Label API.'
  s.homepage = 'https://github.com/NoonPacific/WhiteLabelSwift'
  s.social_media_url = 'https://twitter.com/NoonPacific'
  s.authors  = { 'Alex Givens' => 'alex@noonpacific.com' }
  s.source   = { :git => 'https://github.com/NoonPacific/WhiteLabelSwift.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.dependency 'AFNetworking', '~> 3.0'
  s.frameworks = 'Foundation'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end
