# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# you need at least version 13.0 for this tutorial, more recent versions are valid too
platform :ios, '13.0'

target 'DIGA' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DIGA
  pod 'Amplify'
  pod 'AmplifyPlugins/AWSAPIPlugin'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'Amplify/Tools'
  # allows to call amplify CLI from within Xcode

  pod 'AmplifyPlugins/AWSCognitoAuthPlugin'
  # support for Cognito user authentication
  
  pod 'AWSMobileClient'
  pod 'AWSAuthUI'
  pod 'AWSUserPoolsSignIn'
  pod 'SSCustomTabbar'

  target 'DIGATests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DIGAUITests' do
    # Pods for testing
  end

end
