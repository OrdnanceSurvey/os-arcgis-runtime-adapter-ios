Pod::Spec.new do |s|
  s.name         = 'OSArcGISRuntimeAdapter'
  s.version      = '0.9.1'
  s.summary      = 'ArcGIS Runtime adapter framework for OS Maps API.'

  s.description  = <<-DESC
                    A small framework that enables rapid integration of the
                    ESRI ArcGIS Runtime iOS SDK with the OS Maps API.
                   DESC

  s.homepage     = 'https://github.com/OrdnanceSurvey/os-arcgis-runtime-adapter-ios'
  s.license      = 'OGL'
  s.authors       = { 'Ordnance Survey' => 'mobiledevelopers@os.uk' }
  s.platform     = :ios, '8.1'

  s.source       = { :git => 'https://github.com/OrdnanceSurvey/os-arcgis-runtime-adapter-ios.git', :tag => s.version.to_s }

  s.source_files  = 'OSArcGISRuntimeAdapter'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$HOME/Library/SDKs/ArcGIS/iOS' }
  # s.dependency "JSONKit", "~> 1.4"

end
