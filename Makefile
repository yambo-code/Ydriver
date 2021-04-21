#
#     Copyright (C) 2000-2021 the YAMBO team
#           http://www.yambo-code.org
#
# Authors (see AUTHORS file for details): AM
#
# This file is distributed under the terms of the GNU
# General Public License. You can redistribute it and/or
# modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation;
# either version 2, or (at your option) any later version.
#
# This program is distributed in the hope that it will
# be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public
# License along with this program; if not, write to the Free
# Software Foundation, Inc., 59 Temple Place - Suite 330,Boston,
# MA 02111-1307, USA or visit http://www.gnu.org/copyleft/gpl.txt.
#
ifeq ($(wildcard config/defs.mk),config/defs.mk)
 include config/defs.mk
else
 $(error Run ./configure first)
endif
#
dopts=-D_CUDA -D_SCALAPACK -D_SLEPC -D_PAR_IO -D_HDF5_IO -D_HDF5_LIB -D_example_driver 
linclude=-I./example/include/ -I./include
lib_target=./lib/libdriver.a
exe_target=bin/driver.x
#
objs_int_c :=$(patsubst %.c,%.o,$(wildcard src/interface/*.c))
objs_int_F :=$(patsubst %.F,%.o,$(wildcard src/interface/*.F))
objs_main_c:=$(patsubst %.c,%.o,$(wildcard src/main/*.c))
objs_opt_c :=$(patsubst %.c,%.o,$(wildcard src/options/*.c))
objs_eopt_c :=$(patsubst %.c,%.o,$(wildcard example/options/*.c))
objs_driver=example/main.o src/driver/driver.o
objs=$(objs_int_c) $(objs_int_F) $(objs_main_c) $(objs_opt_c) $(objs_eopt_c) 
#
all: arcreate link
#
arcreate: $(objs) $(objs_driver)
	@if test -f c_driver.mod; then mv c_driver.mod include; fi
	@(eval $(ar) $(arflags) $(lib_target) $(objs)) > /dev/null
	@chmod u+x $(lib_target)

link: $(objs_driver)
	$(link)

clean:
	$(clean)

#
# Functions
#
define link
  @(eval $(fc) $(fcflags) -o $(exe_target) $(objs_driver) $(lib_target) $(linclude) ) > /dev/null
endef
define clean
 @find . \( -name '*.o' -o -name '*.f90' -o -name '*_source' -o -name '*.a' -o -name '*.mod' \
        -o -name '*_cpp.f' -o -name 'ifc*' -o -name '__*' -o -name '*.s' -o -name 'penmp' -o -name '*.x' -o -name 'version.h' \)  -type f -print | xargs rm -fr
 @echo "[CLEAN] Objects ... done"
 @rm -fr autom4te.cache config.log config.status config/defs.mk
 @echo "[CLEAN] Config files ... done"
endef
#
# Suffixes
#
.SUFFIXES: .F .f90 .c .f .o .a
#
# Rules
#
.F.o:
	@(eval $(fpp) $(dopts) $*.F > $*.tmp_source)
	@mv $*.tmp_source $*$(f90suffix)
	@($(fc) -c $(fcflags) $*$(f90suffix) $(linclude) -o $*.o) > /dev/null
.c.o:
	@(eval $(cc) $(cflags) $(dopts) $(linclude) -c $*.c -o $*.o) > /dev/null


