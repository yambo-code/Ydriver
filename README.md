## Yambo Libraries

This is the distribution of the Libraries needed during the compilation of the Yambo source (http://www.yambo-code.org).

There are two kind of libraries:
* internal: those are derived from the Yambo source itself. Some modular parts have been made independent and exported. 
* external: those are standard libraries packed so to be usable by Yambo.

You do not need to download the library files, unless you don't want to use them for you code.

In any case the libraries will be automatically downloaded either at the git checkout time or when building the source (depending on the way yambo was installed).

In case you are going to compile yambo on a machine that does not have access to the internet, you can first get all needed files in the proper place just entering the yambo source and running (option available since version 5.0 and without running the configure script)

`make download`

### Internal Libraries (Needed since yambo 5.0)

As part of the modularization of the Yambo code, one of the goals is to split the source into different blocks (or modules), and eventually promote them into libraries. So far we created, as an experimental library, the driver library.
The source code of the library is not contained anymore in the main repo of the yambo code, but it has been moved in this dedicated repository:

The driver releases can be found in the [releases](https://github.com/yambo-code/Ydriver/releases) page.

### Yambo
Yambo doesn't stand for anything like "Yet Another Many-Body cOde", for instance.  Unless you really want it to. 

For more information, see the general documentation on the web site http://www.yambo-code.org/

Compiling:  http://www.yambo-code.org/download/compiling.php
Installing: http://www.yambo-code.org/download/installing.php
Getting started: http://www.yambo-code.org/doc/getting_started.php

All the material included in this distribution is free software;
you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later version.

These programs are distributed in the hope that they will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
for more details (see COPYING file).
