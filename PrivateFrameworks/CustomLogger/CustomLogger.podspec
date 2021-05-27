
Pod::Spec.new do |spec|
  spec.name         = "CustomLogger"
  spec.platform     = :ios, "12.0"
  spec.version      = "1.0.0"
  spec.homepage     = "https://www.example.com"
  spec.author       = "Demo"
  spec.license = { :type => 'MIT', :text => <<-LICENSE
                   Copyright 2020
                   Permission is granted to Demo
                   LICENSE
                 }
  spec.source      = {:git => 'git@github.com:app/app.git', :version => spec.version}
  spec.summary      = "CustomLogger framework summary"
  spec.description  = "CustomLogger framework description"
  spec.swift_version = "5.0"
  spec.source_files = "*.swift"
end
