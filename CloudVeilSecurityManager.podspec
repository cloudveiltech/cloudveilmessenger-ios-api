Pod::Spec.new do |s|  
    s.name              = 'CloudVeilSecurityManager'
    s.version           = '1.0'
    s.summary           = 'A really cool SDK that logs stuff.'
    s.homepage          = 'https://github.com/dmitryvirych/CloudVeil-securityManager-ios'

    s.author            = { 'Name' => 'damienissa@yahoo.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'https://github.com/dmitryvirych/CloudVeil-securityManager-ios' }

    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'SecurityManager.framework'
end  