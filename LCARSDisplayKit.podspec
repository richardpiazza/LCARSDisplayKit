Pod::Spec.new do |s|
  s.name = "LCARSDisplayKit"
  s.version = "2.1.0"
  s.summary = "A Hobby Project."
  s.description = <<-DESC
  A Swift library for developing personal iOS apps with an LCARS© interface.
                     DESC
  s.homepage = "https://github.com/richardpiazza/LCARSDisplayKit"
  s.license = 'MIT'
  s.author = { "Richard Piazza" => "github@richardpiazza.com" }
  s.social_media_url = 'https://twitter.com/richardpiazza'

  s.source = { :git => "https://github.com/richardpiazza/LCARSDisplayKit.git", :tag => s.version.to_s }
  s.source_files = 'Sources/*'
  s.resource_files = 'Resources/*'
  s.platforms = { :ios => '11.0' }
  s.frameworks = 'Foundation'
  s.requires_arc = true
  s.dependency 'GraphPoint', '~> 3.0'

end
