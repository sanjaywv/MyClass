

Pod::Spec.new do |spec|



  spec.name         = "UiViewClass"
  spec.version      = "1.0.0"
  spec.summary      = "This is a UIView Class webvillee framework ! yeah Datta"

  
  spec.description  = "This is a framework craeted by a webvillee developer"

  spec.homepage     = "https://github.com/sanjaywv/UIViewClass.git"
  

  spec.license      = "MIT"

  spec.author             = { "Sandeep Singh" => "sandeep.webvillee@gmail.com" }
 spec.platform     = :ios, "11.0"

 spec.swift_version = '4.2'

 spec.source       = { :git => "https://github.com/sanjaywv/UIViewClass.git", :tag => "1.0.0" }


 
 spec.source_files  = "UiViewClass/UiViewClass/**/*"
 spec.exclude_files = "UiViewClass/UiViewClass/*.plist"
 
end
