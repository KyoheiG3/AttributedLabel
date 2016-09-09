Pod::Spec.new do |s|
  s.name         = "AttributedLabel"
  s.version      = "0.4.0"
  s.summary      = "Easy to use, fast, and higher performance than UILabel."
  s.homepage     = "https://github.com/KyoheiG3/AttributedLabel"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Kyohei Ito" => "je.suis.kyohei@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/KyoheiG3/AttributedLabel.git", :tag => s.version.to_s }
  s.source_files  = "AttributedLabel/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks = "UIKit"
end
