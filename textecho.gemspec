Gem::Specification.new do |s|
  s.name        = "textecho"
  s.version     = "0.1.2"
  s.author      = "Scott Sproule"
  s.email       = "scott.sproule@estormtech.com"
  s.homepage    = "http://github.com/semdinsp/textech"
  s.summary     = "Base sms application"
  s.description = "Common application for telkcomcel in Timor Leste." 
  s.executables = ['']    #should be "name.rb"
  s.files        = Dir["{lib,test}/**/*"] +Dir["bin/*.rb"] + Dir["[A-Z]*"] # + ["init.rb"]
  s.require_path = "lib"
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end