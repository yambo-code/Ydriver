#
#        Copyright (C) 2000-2020 the YAMBO team
#              http://www.yambo-code.org
#
# Authors (see AUTHORS file for details): AM, DS
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
AC_INIT(Yambo Driver Library, 0.1.0 r.XXX h.XXX, yambo@yambo-code.org)
#
AC_CONFIG_AUX_DIR(config)
#
# YAMBO SPECIFIC
#
#m4_include([config/m4/yambo_specific.m4])
#m4_include([config/m4/yambo_libraries.m4])
# 
#  General
#
#m4_include([config/m4/acx_misc.m4])
#m4_include([config/m4/acx_gmake.m4])
#m4_include([config/m4/acx_cpp.m4])
#m4_include([config/m4/acx_fpp.m4])
#m4_include([config/m4/ax_f90_module_flag.m4])
#m4_include([config/m4/acx_get_fc_kind.m4])
#m4_include([config/m4/acx_get_mpi_kind.m4])
#m4_include([config/m4/acx_fortran_flags.m4])
#m4_include([config/m4/acx_mpi.m4])
#m4_include([config/m4/cuda.m4])
#m4_include([config/m4/acx_branch.m4])
# 
#  Report
#
#m4_include([config/m4/acx_report.m4])
# ============================================================================
# Current branch
#ACX_BRANCH
#
# Checks for library functions.
# ============================================================================
#AC_CHECK_HEADERS([malloc.h stdlib.h unistd.h string.h sys/time.h])
#AC_FUNC_ALLOCA
#AC_C_CONST
#AC_C_INLINE
#AC_FUNC_MALLOC
#AC_FUNC_REALLOC
#AC_FUNC_SETVBUF_REVERSED
#AC_FUNC_STAT
#AC_PROG_MAKE_SET
# ============================================================================
# check size of pointers to int - needed to decide the size of integer
# arrays in fortran holding C pointers for FFTW
#ACX_POINTER_SIZE
#SIZEOF_INT_P=$ac_pointersize
#AC_SUBST(SIZEOF_INT_P)
# 
# ============================================================================
# Checks for programs.
#AC_PROG_CC
#
#AC_CANONICAL_HOST
#hostname=`uname -n`
#AC_SUBST(hostname)
# ============================================================================
# GNU Make
#MAKE="make"
#CHECK_GNU_MAKE()
#if test "$_cv_gnu_make_command" = ""; then
# ACX_CHECK_MAKE
# if ! test "$make_works" = "yes"; then
#  AC_MSG_ERROR(Make does not accept function statments (use gmake if possible))
# fi
#else
# MAKE=$_cv_gnu_make_command
#fi
#AC_SUBST(MAKE)
# ============================================================================
#AR 
AC_CHECK_TOOL(AR, ar, false)
test -z "$AR" && AR=ar
test -z "$AR_FLAGS" && AR_FLAGS="-ru"
AC_SUBST(AR_FLAGS)
#
# ============================================================================
#
# C options specific for driver.c
#
#AC_ARG_ENABLE(options_check, AC_HELP_STRING([--enable-options-check],
#              [Enable the command line options check in driver.c. Default is yes.]))
#if test x"$enable_options_check" = "x"; then enable_options_check="yes"; fi
#if test x"$enable_options_check" = "xno"; then
# SAVE=$CFLAGS
# CFLAGS="${SAVE} -D_NO_OPTIONS_CHECK"
#fi
#
# ============================================================================
#
# Fortran 90
#
acx_save_fcflags="$FCFLAGS"
AC_PROG_FC([],[90])
if test "$FC" = "" ; then
 AC_MSG_ERROR([could not find Fortran 90 compiler])
fi
# WIDESETUP affects the FCFLAGS/CFLAGS only if the variable is empty
#ACX_WIDESETUP
AC_LANG_PUSH(Fortran)
#
# F90 extension
#
AC_ARG_WITH(f90ext, AC_HELP_STRING([--with-f90ext=<flags>],
           [Use .<flags> Fortran 90 extension],[32]))
if ! test -z "$with_f90ext"; then F90SUFFIX=".$with_f90ext"; fi
case $F90SUFFIX in
 .f90)
   AC_FC_SRCEXT(f90,[F90SUFFIX=".f90"; F90EXTFLAGS="$FCFLAGS_f90"],[])
   ;;
 .f)
   AC_FC_SRCEXT(f,[F90SUFFIX=".f"; F90EXTFLAGS="$FCFLAGS_f"],[])
   ;;
esac
AC_SUBST(F90SUFFIX)
FCFLAGS="${acx_save_fcflags}"
acx_save_fcflags="$FCFLAGS"
#ACX_GET_FC_KIND()
#
# Fortran FLAGS
#
ACX_FCSETUP()
#
#acx_save_fcflags="$FCFLAGS"
#FCFLAGS="$acx_save_fcflags $F90EXTFLAGS"
#
# ============================================================================
# Underscore options in subroutine naming
#
#ACX_EXTUS
#
# Commented by AM on August 28 because it was imposing an F77 different from the FC
# leading to linking conflicts
#
#AC_F77_WRAPPERS
#
# Free Form sepcific options
#
#AC_FC_FREEFORM
#
#AC_LANG_POP(Fortran)
#
# ============================================================================
# CPP check & flags
#ACX_CPP
#
# ============================================================================
# FPP check
#ACX_FPP
#
# ============================================================================
# MPI
#m4_include([config/m4/mpi.m4])
#m4_include([config/urls/repos.list])
# 
AC_LANG_PUSH(Fortran)
AC_CONFIG_FILES([config/mk/defs.mk])
#
