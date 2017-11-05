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
static const char *ng0 = "C:/Users/Rosswell/Documents/CPU/Integer_Data_Path/alu16.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {7U, 0U};
static unsigned int ng10[] = {8U, 0U};
static unsigned int ng11[] = {9U, 0U};
static unsigned int ng12[] = {10U, 0U};
static unsigned int ng13[] = {11U, 0U};
static unsigned int ng14[] = {12U, 0U};
static int ng15[] = {0, 0};



static void Always_25_0(char *t0)
{
    char t7[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(25, ng0);

LAB5:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB31;

LAB32:
LAB34:
LAB33:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t2, 1, t3, 16);
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 16);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t7, 16, 0, 1);

LAB35:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 15);
    t14 = (t13 & 1);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t9);
    t16 = (t15 >> 15);
    t17 = (t16 & 1);
    *((unsigned int *)t8) = t17;
    t10 = (t0 + 1928);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t8 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t9 = (t4 + 4);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t9);
    t16 = *((unsigned int *)t10);
    t17 = (t15 ^ t16);
    t19 = (t14 | t17);
    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t10);
    t22 = (t20 | t21);
    t24 = (~(t22));
    t25 = (t19 & t24);
    if (t25 != 0)
        goto LAB52;

LAB49:    if (t22 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t7) = 1;

LAB52:    t23 = (t7 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB55:    goto LAB2;

LAB7:    xsi_set_current_line(27, ng0);
    t8 = (t0 + 1208U);
    t9 = *((char **)t8);
    t8 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t8, 1, t9, 16);
    t10 = (t0 + 1768);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 16);
    t11 = (t0 + 2248);
    xsi_vlogvar_assign_value(t11, t7, 16, 0, 1);
    goto LAB35;

LAB9:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t3, 1, t4, 16);
    t8 = (t0 + 1768);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB11:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 32, t4, 16, t3, 32);
    t8 = (t0 + 1768);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB13:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_minus(t7, 32, t4, 16, t3, 32);
    t8 = (t0 + 1768);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB15:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t8 = *((char **)t3);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 17, t4, 16, t8, 16);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB17:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t8 = *((char **)t3);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_minus(t7, 17, t4, 16, t8, 16);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB19:    xsi_set_current_line(33, ng0);

LAB36:    xsi_set_current_line(34, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t3 = (t7 + 4);
    t8 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t8);
    t16 = (t15 >> 0);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 0, 0, 1);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_rshift(t7, 16, t3, 16, t2, 32);
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 16);
    goto LAB35;

LAB21:    xsi_set_current_line(37, ng0);

LAB37:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t3 = (t7 + 4);
    t8 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 15);
    t14 = (t13 & 1);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t8);
    t16 = (t15 >> 15);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 0, 0, 1);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_lshift(t7, 16, t3, 16, t2, 32);
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 16);
    goto LAB35;

LAB23:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t8 = *((char **)t3);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t8);
    t14 = (t12 & t13);
    *((unsigned int *)t18) = t14;
    t3 = (t4 + 4);
    t9 = (t8 + 4);
    t10 = (t18 + 4);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t9);
    t17 = (t15 | t16);
    *((unsigned int *)t10) = t17;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB38;

LAB39:
LAB40:    t40 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t40, 1, t18, 16);
    t41 = (t0 + 1768);
    xsi_vlogvar_assign_value(t41, t7, 0, 0, 16);
    t42 = (t0 + 2248);
    xsi_vlogvar_assign_value(t42, t7, 16, 0, 1);
    goto LAB35;

LAB25:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t8 = *((char **)t3);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t8);
    t14 = (t12 | t13);
    *((unsigned int *)t18) = t14;
    t3 = (t4 + 4);
    t9 = (t8 + 4);
    t10 = (t18 + 4);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t9);
    t17 = (t15 | t16);
    *((unsigned int *)t10) = t17;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB41;

LAB42:
LAB43:    t40 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t40, 1, t18, 16);
    t41 = (t0 + 1768);
    xsi_vlogvar_assign_value(t41, t7, 0, 0, 16);
    t42 = (t0 + 2248);
    xsi_vlogvar_assign_value(t42, t7, 16, 0, 1);
    goto LAB35;

LAB27:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t8 = *((char **)t3);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    *((unsigned int *)t18) = t14;
    t3 = (t4 + 4);
    t9 = (t8 + 4);
    t10 = (t18 + 4);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t9);
    t17 = (t15 | t16);
    *((unsigned int *)t10) = t17;
    t19 = *((unsigned int *)t10);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB44;

LAB45:
LAB46:    t11 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t11, 1, t18, 16);
    t23 = (t0 + 1768);
    xsi_vlogvar_assign_value(t23, t7, 0, 0, 16);
    t40 = (t0 + 2248);
    xsi_vlogvar_assign_value(t40, t7, 16, 0, 1);
    goto LAB35;

LAB29:    xsi_set_current_line(45, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t8 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (~(t12));
    *((unsigned int *)t18) = t13;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t8) != 0)
        goto LAB48;

LAB47:    t19 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t19 & 65535U);
    t20 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t20 & 65535U);
    t9 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 17, 17, 2U, t9, 1, t18, 16);
    t10 = (t0 + 1768);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 16);
    t11 = (t0 + 2248);
    xsi_vlogvar_assign_value(t11, t7, 16, 0, 1);
    goto LAB35;

LAB31:    xsi_set_current_line(46, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 1208U);
    t8 = *((char **)t4);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_minus(t7, 32, t3, 32, t8, 16);
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 16);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t7, 16, 0, 1);
    goto LAB35;

LAB38:    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t18) = (t21 | t22);
    t11 = (t4 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (~(t26));
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t23);
    t31 = (~(t30));
    t32 = (t25 & t27);
    t33 = (t29 & t31);
    t34 = (~(t32));
    t35 = (~(t33));
    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & t34);
    t37 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t37 & t35);
    t38 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t38 & t34);
    t39 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t39 & t35);
    goto LAB40;

LAB41:    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t18) = (t21 | t22);
    t11 = (t4 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t32 = (t26 & t25);
    t27 = *((unsigned int *)t23);
    t28 = (~(t27));
    t29 = *((unsigned int *)t8);
    t33 = (t29 & t28);
    t30 = (~(t32));
    t31 = (~(t33));
    t34 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t34 & t30);
    t35 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t35 & t31);
    goto LAB43;

LAB44:    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t18) = (t21 | t22);
    goto LAB46;

LAB48:    t14 = *((unsigned int *)t18);
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t18) = (t14 | t15);
    t16 = *((unsigned int *)t3);
    t17 = *((unsigned int *)t8);
    *((unsigned int *)t3) = (t16 | t17);
    goto LAB47;

LAB51:    t11 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(53, ng0);
    t40 = ((char*)((ng2)));
    t41 = (t0 + 2088);
    xsi_vlogvar_assign_value(t41, t40, 0, 0, 1);
    goto LAB55;

}


extern void work_m_00000000003189959606_1184866726_init()
{
	static char *pe[] = {(void *)Always_25_0};
	xsi_register_didat("work_m_00000000003189959606_1184866726", "isim/alu16_tb_isim_beh.exe.sim/work/m_00000000003189959606_1184866726.didat");
	xsi_register_executes(pe);
}
