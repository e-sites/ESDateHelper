Pod::Spec.new do |s|
  s.name           = "ESDateHelper"
  s.version        = "1.3.1"
  s.platform       = :ios, "6.0"
  s.summary        = "Helper category for making the usage of NSDates easier"
  s.author         = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license        = { :type => "BSD", :file => "LICENSE" }
  s.homepage       = "https://github.com/e-sites/ESDateHelper"
  s.source         = { :git => "https://github.com/e-sites/ESDateHelper.git", :tag => s.version.to_s }  
  s.source_files   = "Classes"
  s.requires_arc   = false
end