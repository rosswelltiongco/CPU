/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Jesus/Documents/Xilinx_Files/CPU/Register_File/decoder3to8.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {16U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {32U, 0U};
static unsigned int ng10[] = {6U, 0U};
static unsigned int ng11[] = {64U, 0U};
static unsigned int ng12[] = {7U, 0U};
static unsigned int ng13[] = {128U, 0U};



static void Always_23_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 3968);
    *((int *)t2) = 1;
    t3 = (t0 + 3680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(23, ng0);

LAB5:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t2, 1, 0, 1);
    t5 = (t0 + 2408);
    xsi_vlogvar_assign_value(t5, t2, 2, 0, 1);
    t7 = (t0 + 2248);
    xsi_vlogvar_assign_value(t7, t2, 3, 0, 1);
    t8 = (t0 + 2088);
    xsi_vlogvar_assign_value(t8, t2, 4, 0, 1);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t2, 5, 0, 1);
    t22 = (t0 + 1768);
    xsi_vlogvar_assign_value(t22, t2, 6, 0, 1);
    t28 = (t0 + 1608);
    xsi_vlogvar_assign_value(t28, t2, 7, 0, 1);

LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(25, ng0);
    t28 = (t0 + 1048U);
    t29 = *((char **)t28);

LAB13:    t28 = ((char*)((ng2)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t28, 3);
    if (t30 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng8)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng10)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng12)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 3, t2, 3);
    if (t30 == 1)
        goto LAB28;

LAB29:
LAB31:
LAB30:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t2, 1, 0, 1);
    t5 = (t0 + 2408);
    xsi_vlogvar_assign_value(t5, t2, 2, 0, 1);
    t7 = (t0 + 2248);
    xsi_vlogvar_assign_value(t7, t2, 3, 0, 1);
    t8 = (t0 + 2088);
    xsi_vlogvar_assign_value(t8, t2, 4, 0, 1);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t2, 5, 0, 1);
    t22 = (t0 + 1768);
    xsi_vlogvar_assign_value(t22, t2, 6, 0, 1);
    t28 = (t0 + 1608);
    xsi_vlogvar_assign_value(t28, t2, 7, 0, 1);

LAB32:    goto LAB12;

LAB14:    xsi_set_current_line(26, ng0);
    t31 = ((char*)((ng1)));
    t32 = (t0 + 2728);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 1);
    t33 = (t0 + 2568);
    xsi_vlogvar_assign_value(t33, t31, 1, 0, 1);
    t34 = (t0 + 2408);
    xsi_vlogvar_assign_value(t34, t31, 2, 0, 1);
    t35 = (t0 + 2248);
    xsi_vlogvar_assign_value(t35, t31, 3, 0, 1);
    t36 = (t0 + 2088);
    xsi_vlogvar_assign_value(t36, t31, 4, 0, 1);
    t37 = (t0 + 1928);
    xsi_vlogvar_assign_value(t37, t31, 5, 0, 1);
    t38 = (t0 + 1768);
    xsi_vlogvar_assign_value(t38, t31, 6, 0, 1);
    t39 = (t0 + 1608);
    xsi_vlogvar_assign_value(t39, t31, 7, 0, 1);
    goto LAB32;

LAB16:    xsi_set_current_line(27, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB18:    xsi_set_current_line(28, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB20:    xsi_set_current_line(29, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB22:    xsi_set_current_line(30, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB24:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB26:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

LAB28:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t3, 1, 0, 1);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t3, 2, 0, 1);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t3, 3, 0, 1);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t3, 4, 0, 1);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t3, 5, 0, 1);
    t28 = (t0 + 1768);
    xsi_vlogvar_assign_value(t28, t3, 6, 0, 1);
    t31 = (t0 + 1608);
    xsi_vlogvar_assign_value(t31, t3, 7, 0, 1);
    goto LAB32;

}


extern void work_m_00000000001694058500_1192542009_init()
{
	static char *pe[] = {(void *)Always_23_0};
	xsi_register_didat("work_m_00000000001694058500_1192542009", "isim/Register_File_tb_isim_beh.exe.sim/work/m_00000000001694058500_1192542009.didat");
	xsi_register_executes(pe);
}
