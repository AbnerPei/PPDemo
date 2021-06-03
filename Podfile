# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
#warn_for_unused_master_specs_repo => false
source "https://github.com/CocoaPods/Specs.git"

target 'PPDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PPDemo
  pod 'AFNetworking'
  pod 'SDWebImage', :git => "https://github.com/AbnerPei/SDWebImage.git"
  pod 'Masonry'
  pod 'MJExtension'
  pod 'MJRefresh'
  pod 'WCDB'
  pod 'YYKit'
  pod 'YTKNetwork'
  pod 'Toast'
  
  pod 'PPMaker' #, :path => "../PPMaker"
  pod 'PPTextField' #, :path => "../PPTextField"
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
