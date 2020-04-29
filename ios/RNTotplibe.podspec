
Pod::Spec.new do |s|
  s.name         = "RNTotplibe"
  s.version      = "1.0.0"
  s.summary      = "RNTotplibe"
  s.description  = <<-DESC
                  RNTotplibe
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNTotplibe.git", :tag => "master" }
  s.source_files  = "RNTotplibe/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  