/*
  License-Identifier: GPL
 
  Copyright (C) 2020 The Yambo Team
 
  Authors (see AUTHORS file for details): AM, AC

*/
#include <stdio.h>
#include <ykind.h>
#if defined _yambo || defined _ypp || defined _a2y || defined _p2y || defined _c2y || defined _e2y 
 #include <yambo_driver.h>
#endif
#if defined _example_driver
 #include <example_driver.h>
#endif
#include <ydriver.h>
#include <stdlib.h>

void options_maker(struct options_struct options[], int n_options)
{
 int i_opt,dummy,i;
 int max_long_desc=20;

 for(i_opt=0;i_opt<n_options;i_opt++) {
  options[i_opt].long_opt=NULL;
  options[i_opt].short_opt=0;
  options[i_opt].short_desc=NULL;
  for(i=0;i<max_long_desc;i++) options[i_opt].long_desc[i]=NULL;
  options[i_opt].yambo_string="unused";
  options[i_opt].bin="all";
  options[i_opt].int_var=0;
  options[i_opt].float_var=0;
  options[i_opt].char_var=0;
  options[i_opt].serial_var=0;
  options[i_opt].optional_var=0;
  options[i_opt].section="undef";
 }
 i_opt=-1;
 /* 
  Help(s) 
 */
 options_help(options,&i_opt);
 /* 
  Control(s)
 */
#if defined _yambo || defined _ypp || defined _a2y || defined _p2y || defined _c2y || defined _e2y 
 options_control(options,&i_opt);
#endif

#if defined _yambo 
 /* 
  Yambo
 */
 options_yambo(options,&i_opt);
 /* 
  Projects
 */
 options_projects(options,&i_opt);
#endif

#if defined _ypp 
 /* 
  Ypp
 */
 options_ypp(options,&i_opt);
#endif

#if defined _a2y || defined _p2y || defined _c2y || defined _e2y 
 /* 
  Interfaces
 */
 options_interfaces(options,&i_opt);
#endif
 /* 
  Assign dummy short options to variables with only long options
 */
 dummy=57;
 for(i_opt=0;i_opt<n_options;i_opt++){
  if (!options[i_opt].short_desc) break;
  if (options[i_opt].short_opt > 0 ) continue;
  options[i_opt].short_opt=dummy;
  dummy--;
 }
}
