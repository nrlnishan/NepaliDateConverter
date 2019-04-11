
Pod::Spec.new do |spec|

  spec.name         = "NepaliDateConverter"
  spec.version      = "1.0.0"
  spec.summary      = "Nepali to English & vice versa date conversion library in Swift"
  spec.description  = <<-DESC
A date conversion library written in swift to convert Nepali date to English & vice versa.
                   DESC
  spec.homepage     = "https://github.com/nrlnishan/NepaliDateConverter"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Nishan" => "githubnrlnishan@gmail.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/nrlnishan/NepaliDateConverter.git", :tag => spec.version }
  spec.source_files  = "NepaliDateConverter/Core/*.swift"

end
