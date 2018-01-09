Pod::Spec.new do |s|
  s.name             = 'SortAlgorithm'
  s.version          = "1.1.1"
  s.summary          = "Swift array sort algorithm"
  s.homepage         = "https://github.com/Meniny/SortAlgorithm"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = 'Elias Abel'
  s.source           = { :git => "https://github.com/Meniny/SortAlgorithm.git", :tag => s.version.to_s }
  s.social_media_url = 'https://meniny.cn/'
  s.source_files     = "SortAlgorithm/**/*.swift"
  s.requires_arc     = true
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
  s.macos.deployment_target = "10.9"
  s.description  = "SortAlgorithm is a Swift array sort algorithm framework."
  s.module_name = 'SortAlgorithm'
end
