# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
use_frameworks!
inhibit_all_warnings!

# Pods for WhiteLabelDemo
target 'WhiteLabelDemo' do
  pod 'LaunchDarkly'
  pod 'CustomLogger', :path => './PrivateFrameworks/CustomLogger'

  if ENV['GOOGLE_MAPS'] == "true"
    pod 'GoogleMaps'
  end
end
