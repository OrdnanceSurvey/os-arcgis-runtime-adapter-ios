Pod::Spec.new do |spec|
  spec.name         = 'OSArcGISRuntimeAdapter'
  spec.version      = '0.9.4'
  spec.summary      = 'ArcGIS Runtime adapter framework for OS Maps API.'

  spec.description  = <<-DESC
                    A small framework that enables rapid integration of the
                    ESRI ArcGIS Runtime iOS SDK with the OS Maps API.
                   DESC

  spec.homepage     = 'https://github.com/OrdnanceSurvey/os-arcgis-runtime-adapter-ios'
  spec.license      = 'OGL'
  spec.authors       = { 'Ordnance Survey' => 'mobiledevelopers@os.uk' }

  spec.platform     = :ios, '8.1'

  spec.source       = { :git => 'https://github.com/OrdnanceSurvey/os-arcgis-runtime-adapter-ios.git', :tag => spec.version.to_s }

  spec.source_files  = 'OSArcGISRuntimeAdapter'

  spec.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$HOME/Library/SDKs/ArcGIS/iOS', 'OTHER_LDFLAGS' => '-ObjC -framework ArcGIS -l c++' }
  # s.dependency "JSONKit", "~> 1.4"

end
