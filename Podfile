platform :ios, '11.0'
inhibit_all_warnings!
use_modular_headers!

target 'CoctailMaster' do

  pod 'Alamofire'
  pod 'R.swift'
  pod 'DITranquillity'
  pod 'SwiftyUserDefaults'

  target 'CoctailMasterTests' do
    inherit! :search_paths
  end
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
