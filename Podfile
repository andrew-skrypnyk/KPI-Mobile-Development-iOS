# Uncomment the next line to define a global platform for your project
platform :ios, '14.4'


def common_settings
  use_frameworks!
  inhibit_all_warnings!
end

def analytics_pods
  # Analytics
  pod 'Amplitude-iOS'
  pod 'FacebookSDK'
  pod 'AppCenter'
  pod 'AppCenter/Distribute'
  pod 'Firebase/Analytics', '7.3.0'
  pod 'Firebase/Crashlytics', '7.3.0'
end


def storage

  # Data Base
  pod 'RealmSwift'
end

target 'KPI Example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KPI Example
  common_settings
  analytics_pods
  storage

  # Views
  pod 'lottie-ios'

  # Tools
  pod 'Alamofire'

  #google_utilites
  pod 'Firebase/Auth', '7.3.0'
  pod 'Firebase/Core', '7.3.0'
  pod 'Firebase/Firestore', '7.3.0'
  pod 'Firebase/Messaging', '7.3.0'
  pod 'Firebase/Performance', '7.3.0'
  pod 'Firebase/RemoteConfig', '7.3.0'
  pod 'GoogleSignIn'
  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Email'

  target 'KPI ExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'KPI ExampleUITests' do
    # Pods for testing
  end

end
