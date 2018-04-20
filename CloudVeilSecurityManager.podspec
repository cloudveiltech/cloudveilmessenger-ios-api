Pod::Spec.new do |s|
	s.name             = 'CloudVeilSecurityManager'
	s.version          = '1.0.3'
	s.swift_version 	 = '4.0'
	s.summary          = 'SDK for CloudVeil API'
	s.description      = 'CloudVeil SDK using for security managing'
	s.homepage         = 'https://www.requestum.com'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'Dmitriy Virych' => 'dmitry.virych@requestum.com' }
	s.source           = { :git => 'https://github.com/cloudveiltech/cloudveilmessenger-ios-api.git', :tag => s.version.to_s }
	s.ios.deployment_target = '10.0'
	s.source_files = 'SecurityManager/**/*'
	s.dependency 'Alamofire'
	s.dependency 'ObjectMapper'
end