--- !ruby/object:Gem::Specification 
name: webri
version: !ruby/object:Gem::Version 
  hash: 15
  prerelease: false
  segments: 
  - 2
  - 0
  - 0
  version: 2.0.0
platform: ruby
authors: 
- Thomas Sawyer
autorequire: 
bindir: bin
cert_chain: []

date: 2011-04-20 00:00:00 -04:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: syckle
  prerelease: false
  requirement: &id001 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :development
  version_requirements: *id001
description: WebRI is a Webrick-based RI browser.
email: ""
executables: 
- webri
extensions: []

extra_rdoc_files: 
- README.rdoc
files: 
- bin/webri
- lib/webri/assets/css/style.css
- lib/webri/assets/css/style1.css
- lib/webri/assets/img/class.png
- lib/webri/assets/img/dir.gif
- lib/webri/assets/img/mod.ico
- lib/webri/assets/img/ruby_logo.png
- lib/webri/assets/js/jquery.js
- lib/webri/assets/js/ri.jquery.js
- lib/webri/core_ext/fileutils.rb
- lib/webri/core_ext/rdoc.rb
- lib/webri/core_ext/times.rb
- lib/webri/generator.rb
- lib/webri/generator1.rb
- lib/webri/heirarchy.rb
- lib/webri/opesc.rb
- lib/webri/ri_service.rb
- lib/webri/server.rb
- lib/webri/templates/index.html
- lib/webri/templates/index1.html
- lib/webri.rb
- Profile
- README.rdoc
- History.rdoc
- Version
- License.txt
- Roadmap.rdoc
has_rdoc: true
homepage: http://proutils.github.com/webme
licenses: 
- Apache 2.0
post_install_message: 
rdoc_options: 
- --title
- WebRI API
- --main
- README.rdoc
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
required_rubygems_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
requirements: []

rubyforge_project: webri
rubygems_version: 1.3.7
signing_key: 
specification_version: 3
summary: RI Web Browser
test_files: []

