lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "string-surgeon"
  spec.version       = "1.0.1"
  spec.licenses      = ['MIT']
  spec.authors       = ["Himanshu Joshi"]
  spec.email         = ["himaenshu@gmail.com"]
  spec.summary       = "String Surgeon is the ruby gem to gracefully cut open a string having hyperlinks, #hashtags and @mentions"
  spec.homepage      = "https://github.com/himaenshu/string-surgeon"
  spec.files         = Dir.glob("lib/**/*") + %w(License.txt README.md)
  spec.require_paths = ["lib"]
end
