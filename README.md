Description
===========

Installs the Oracle Java JDK using a script by Martin Wimpress ([https://github.com/flexiondotorg/oab-java6](https://github.com/flexiondotorg/oab-java6)) which is itself a wrapper around Debian packaging scripts by Janusz Dziemidowicz ([https://github.com/rraptorr/sun-java6](https://github.com/rraptorr/sun-java6), [https://github.com/rraptorr/oracle-java7](https://github.com/rraptorr/oracle-java7)).

Requirements
============

Platform
--------

* Debian, Ubuntu

Attributes
==========

* `node["java"]["jdk_version"]` - Version of JDK you would like installed (`6` or `7`), default `6`.

Recipes
=======

default
-------

The default recipe sets up a local apt repository in /var/local/oab/deb then installs sun-java6-jdk or oracle-java7-jdk packages depending on the setting of the jdk_version attribute.

Usage
=====

Simply include the `java` recipe wherever you would like Java installed.

    name "java"
    description "Install Oracle Java 7 on Ubuntu"
    override_attributes(
      "java" => {
        "jdk_version" => "7"
      }
    )
    run_list(
      "recipe[java]"
    )

License and Author
==================

Author:: Henry Garner (<henry@henrygarner.com>)

Copyright:: 2012, Likely Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

OAB-Java6 License
===========

Copyright (c) 2012 Martin Wimpress, http://flexion.org/

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
