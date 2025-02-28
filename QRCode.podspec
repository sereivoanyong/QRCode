Pod::Spec.new do |s|

s.name                       = 'QRCode'
s.version                    = '14.4.0'
s.summary                    = 'A simple drop-in macOS/iOS/tvOS/watchOS QR Code generator view for Swift, Objective-C and SwiftUI.'
s.homepage                   = 'https://github.com/dagronf/QRCode'
s.license                    = { :type => 'MIT', :file => 'LICENSE' }
s.author                     = { 'Darren Ford' => 'dford_au-reg@yahoo.com' }
s.source                     = { :git => 'https://github.com/dagronf/QRCode.git', :tag => s.version.to_s }

s.module_name                = 'QRCode'

s.dependency                 'SwiftQRCodeGenerator'
s.dependency                 'SwiftImageReadWrite', '~> 1.1.6'

s.osx.deployment_target      = '10.11'
s.ios.deployment_target      = '13.0'
s.tvos.deployment_target     = '13.0'
s.watchos.deployment_target  = '6.0'

s.osx.framework              = 'AppKit'
s.ios.framework              = 'UIKit'
s.tvos.framework             = 'UIKit'
s.watchos.framework          = 'UIKit'

s.source_files               = 'Sources/QRCode/**/*.swift'
s.swift_version              = "5.4"
s.resources                  = 'Sources/QRCode/**/*.strings'

end
