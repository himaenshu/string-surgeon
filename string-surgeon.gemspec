lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "string-surgeon"
  spec.version       = "0.0.1"
  spec.authors       = ["Himanshu Joshi"]
  spec.email				 = ["himaenshu@gmail.com"]
  spec.summary       = "String Surgeon is the ruby gem to gracefully cut open a string having hyperlinks"
  spec.files         = ["lib/string_surgeon.rb"]
  spec.require_paths = ["lib"]
end
