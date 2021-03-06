

require "json"
package = JSON.parse(File.read(File.join(__dir__, "../package.json")))

Pod::Spec.new do |s|
  s.name         = "RNTotplibe"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  RNTotplibe
                   DESC
  s.homepage     = "https://github.com/paulcapelo/simpleTotp#readme"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "jhonnathanp27@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/paulcapelo/simpleTotp.git", :tag => "#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"
  s.swift_version = '5.0'
  s.requires_arc = true
  s.dependency "React"
  #s.dependency "others"
end

