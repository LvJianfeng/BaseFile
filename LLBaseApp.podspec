Pod::Spec.new do |s|
  s.name         = "LLBaseApp"
  s.version      = "0.0.1"
  s.summary      = "个人自用文件"
  s.homepage     = "https://github.com/LvJianfeng/LLBaseFile"
  s.license      = "MIT"
  s.author             = { "LvJianfeng" => "coderjianfeng@foxmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/LvJianfeng/BaseFile.git", :tag => "#{s.version}" }

  s.source_files  = "LLBaseApp", "LLBaseApp/**/*.{*}"
  s.exclude_files = "LLBaseApp"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end

