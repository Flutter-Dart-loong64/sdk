.text

#if defined(__linux__) || defined(__FreeBSD__) /* HOST_OS_LINUX */
.globl ClobberAndCall
.type ClobberAndCall, @function
ClobberAndCall:
#else /* HOST_OS_MACOS */
.globl _ClobberAndCall
_ClobberAndCall:
#endif

/* Clobber all volatile registers and call the nullary function which is
   passed in as the first argument. */

addi.d $sp, $sp, -96
st.d $ra, $sp, 88
st.d $fp, $sp, 80
st.d $s0, $sp, 72
st.d $s1, $sp, 64
st.d $s2, $sp, 56
st.d $s3, $sp, 48
st.d $s4, $sp, 40
st.d $s5, $sp, 32
st.d $s6, $sp, 24
st.d $s7, $sp, 16
st.d $s8, $sp, 8

addi.d $ra, $zero, 1
addi.d $a1, $zero, 1
addi.d $a2, $zero, 1
addi.d $a3, $zero, 1
addi.d $a4, $zero, 1
addi.d $a5, $zero, 1
addi.d $a6, $zero, 1
addi.d $a7, $zero, 1
addi.d $t0, $zero, 1
addi.d $t1, $zero, 1
addi.d $t2, $zero, 1
addi.d $t3, $zero, 1
addi.d $t4, $zero, 1
addi.d $t5, $zero, 1
addi.d $t6, $zero, 1
addi.d $t7, $zero, 1
addi.d $t8, $zero, 1
addi.d $s0, $zero, 1
addi.d $s1, $zero, 1
addi.d $s2, $zero, 1
addi.d $s3, $zero, 1
addi.d $s4, $zero, 1
addi.d $s5, $zero, 1
addi.d $s6, $zero, 1
addi.d $s7, $zero, 1
addi.d $s8, $zero, 1

jirl $ra, $a0, 0

ld.d $s8, $sp, 8
ld.d $s7, $sp, 16
ld.d $s6, $sp, 24
ld.d $s5, $sp, 32
ld.d $s4, $sp, 40
ld.d $s3, $sp, 48
ld.d $s2, $sp, 56
ld.d $s1, $sp, 64
ld.d $s0, $sp, 72
ld.d $fp, $sp, 80
ld.d $ra, $sp, 88
addi.d $sp, $sp, 96
jirl $zero, $ra, 0
