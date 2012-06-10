maintainer        "Henry Garner"
maintainer_email  "henry@henrygarner.com"
license           "Apache 2.0"
description       "Installs Java runtime using oab-java script by Martin Wimpress (https://github.com/flexiondotorg/oab-java6)"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"

recipe "java", "Installs Java runtime"

%w{ debian ubuntu }.each do |os|
  supports os
end
