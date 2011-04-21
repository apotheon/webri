--- 
name: webri
company: RubyWork
spec_version: 1.0.0
title: WebRI
contact: http://googlegroups.com/group/proutils
requires: 
- group: 
  - build
  name: syckle
  version: 0+
resources: 
  repository: git://github.com/proutils/webme.git
  home: http://proutils.github.com/webme
manifest: 
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
- lib/webri.yml
- Profile
- README.rdoc
- History.rdoc
- Version
- License.txt
- Roadmap.rdoc
version: 2.0.0
licenses: 
- Apache 2.0
copyright: Copyright (c) 2008 Thomas Sawyer
description: WebRI is a Webrick-based RI browser.
summary: RI Web Browser
authors: 
- Thomas Sawyer
created: 2008-02-21
