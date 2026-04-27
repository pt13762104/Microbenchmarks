.text

.global clktest
.global addtest
.global eortest
.global maddaddtest
.global cmptest
.global addmultest
.global addmul21test
.global mixaddjmp21test
.global mul32test
.global mul64test
.global latmul64test
.global noptest
.global fusejmptest
.global jmptest
.global mixmuljmptest
.global mixmuljmptest21
.global mixaddjmptest
.global rortest
.global mixmulrortest

.global _clktest
.global _addtest
.global _eortest
.global _maddaddtest
.global _cmptest
.global _addmultest
.global _addmul21test
.global _mixaddjmp21test
.global _mul32test
.global _mul64test
.global _latmul64test
.global _noptest
.global _fusejmptest
.global _jmptest
.global _mixmuljmptest
.global _mixmuljmptest21
.global _mixaddjmptest
.global _rortest
.global _mixmulrortest

.global vecadd128test
.global latvecadd128test
.global vecmul128test
.global latvecmul128test
.global mixvecaddmul128test
.global faddtest
.global latfaddtest
.global latfmultest
.global latvecfadd128test
.global latvecfmul128test
.global vecfadd128test
.global vecfmul128test
.global mixvecfaddfmul128test
.global mixaddvecadd128test
.global mix3to1addvecadd128test
.global mix1to1addvecadd128test
.global mixmulvecmultest
.global mixvecmulfmultest
.global mixvecaddfaddtest
.global mixjmpvecaddtest
.global mixjmpvecmultest
.global vecfma128test
.global latvecfma128test
.global scalarfmatest
.global latscalarfmatest
.global aesetest
.global mixaesevecadd128test
.global pmulltest
.global mixpmulladd128test

.global _vecadd128test
.global _latvecadd128test
.global _vecmul128test
.global _latvecmul128test
.global _mixvecaddmul128test
.global _faddtest
.global _latfaddtest
.global _latfmultest
.global _latvecfadd128test
.global _latvecfmul128test
.global _vecfadd128test
.global _vecfmul128test
.global _mixvecfaddfmul128test
.global _mixaddvecadd128test
.global _mix3to1addvecadd128test
.global _mix1to1addvecadd128test
.global _mixmulvecmultest
.global _mixvecmulfmultest
.global _mixvecaddfaddtest
.global _mixjmpvecaddtest
.global _mixjmpvecmultest
.global _vecfma128test
.global _latvecfma128test
.global _scalarfmatest
.global _latscalarfmatest

.global mixvecfaddfma128test
.global mixvecfmulfma128test
.global loadtest
.global mixloadstoretest
.global mix21loadstoretest
.global vecloadtest
.global vecstoretest

.global _mixvecfaddfma128test
.global _mixvecfmulfma128test
.global _loadtest
.global _mixloadstoretest
.global _mix21loadstoretest
.global _vecloadtest
.global _vecstoretest

//renamer tests
.global indepmovtest
.global depmovtest
.global xorzerotest
.global movzerotest
.global subzerotest

.global _indepmovtest
.global _depmovtest
.global _xorzerotest
.global _movzerotest
.global _subzerotest
.global _aesetest
.global _mixaesevecadd128test
.global _pmulltest
.global _mixpmulladd128test

.balign 4

/* x0 = arg = iteration count. all iteration counts must be a divisor of 15360 (32, 30, etc. Prefer 32 or 48 instructions.) */
_clktest:
clktest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 32
  eor x13, x13, x13
clktest_loop:
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  sub x0, x0, x14
  cbnz x0, clktest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

_noptest:
noptest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 32
  eor x13, x13, x13
noptest_loop:
  nop
  nop

  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop

  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop

  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  sub x0, x0, x14
  cbnz x0, noptest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

_addtest:
addtest:
  sub sp, sp, #0xa0
  stp x14, x15, [sp, #0x10]
  stp x16, x17, [sp, #0x20]
  stp x18, x19, [sp, #0x30]
  stp x20, x21, [sp, #0x40]
  stp x22, x23, [sp, #0x50]
  stp x24, x25, [sp, #0x60]
  stp x26, x27, [sp, #0x70]
  stp x28, x29, [sp, #0x80]
  stp x12, x13, [sp, #0x90]
  mov x15, 1
  mov x14, 32
  eor x16,x16,x16
  eor x17,x17,x17
  eor x18,x18,x18
  eor x19,x19,x19
  eor x20,x20,x20
  eor x21,x21,x21
  eor x22,x22,x22
  eor x23,x23,x23
  eor x24,x24,x24
  eor x25,x25,x25
  eor x26,x26,x26
  eor x27,x27,x27
  eor x28,x28,x28
  eor x29,x29,x29
  eor x12,x12,x12
  eor x13,x13,x13
addtest_loop:
  add x12,x12,x15
  add x13,x13,x15
  add x16,x16,x15
  add x17,x17,x15
  add x18,x18,x15
  add x19,x19,x15
  add x20,x20,x15
  add x21,x21,x15
  add x22,x22,x15
  add x23,x23,x15
  add x24,x24,x15
  add x25,x25,x15
  add x26,x26,x15
  add x27,x27,x15
  add x28,x28,x15
  add x29,x29,x15
  add x12,x12,x15
  add x13,x13,x15
  add x16,x16,x15
  add x17,x17,x15
  add x18,x18,x15
  add x19,x19,x15
  add x20,x20,x15
  add x21,x21,x15
  add x22,x22,x15
  add x23,x23,x15
  add x24,x24,x15
  add x25,x25,x15
  add x26,x26,x15
  add x27,x27,x15
  add x28,x28,x15
  add x29,x29,x15
  sub x0, x0, x14
  cbnz x0, addtest_loop
  ldp x12, x13, [sp, #0x90]
  ldp x28, x29, [sp, #0x80]
  ldp x26, x27, [sp, #0x70]
  ldp x24, x25, [sp, #0x60]
  ldp x22, x23, [sp, #0x50]
  ldp x20, x21, [sp, #0x40]
  ldp x18, x19, [sp, #0x30]
  ldp x16, x17, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0xa0
  ret 

_maddaddtest:
maddaddtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
  eor x12, x12, x12
  eor x11, x11, x11
  mov x10, 2
  eor x9, x9, x9
  mov x8, 3
maddaddtest_loop:
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  madd x10, x8, x0, x15
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  madd x10, x8, x0, x15 
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  madd x10, x8, x0, x15  
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  madd x10, x8, x0, x15  
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  madd x10, x8, x0, x15  
  sub x0, x0, x14
  cbnz x0, maddaddtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret 

_eortest:
eortest:
  sub sp, sp, #0xa0
  stp x14, x15, [sp, #0x10]
  stp x16, x17, [sp, #0x20]
  stp x18, x19, [sp, #0x30]
  stp x20, x21, [sp, #0x40]
  stp x22, x23, [sp, #0x50]
  stp x24, x25, [sp, #0x60]
  stp x26, x27, [sp, #0x70]
  stp x28, x29, [sp, #0x80]
  stp x12, x13, [sp, #0x90]
  mov x15, 1
  mov x14, 32
  eor x16,x16,x16
  eor x17,x17,x17
  eor x18,x18,x18
  eor x19,x19,x19
  eor x20,x20,x20
  eor x21,x21,x21
  eor x22,x22,x22
  eor x23,x23,x23
  eor x24,x24,x24
  eor x25,x25,x25
  eor x26,x26,x26
  eor x27,x27,x27
  eor x28,x28,x28
  eor x29,x29,x29
  eor x12,x12,x12
  eor x13,x13,x13
eortest_loop:
  eor x12,x12,x15
  eor x13,x13,x15
  eor x16,x16,x15
  eor x17,x17,x15
  eor x18,x18,x15
  eor x19,x19,x15
  eor x20,x20,x15
  eor x21,x21,x15
  eor x22,x22,x15
  eor x23,x23,x15
  eor x24,x24,x15
  eor x25,x25,x15
  eor x26,x26,x15
  eor x27,x27,x15
  eor x28,x28,x15
  eor x29,x29,x15
  eor x12,x12,x15
  eor x13,x13,x15
  eor x16,x16,x15
  eor x17,x17,x15
  eor x18,x18,x15
  eor x19,x19,x15
  eor x20,x20,x15
  eor x21,x21,x15
  eor x22,x22,x15
  eor x23,x23,x15
  eor x24,x24,x15
  eor x25,x25,x15
  eor x26,x26,x15
  eor x27,x27,x15
  eor x28,x28,x15
  eor x29,x29,x15
  sub x0, x0, x14
  cbnz x0, eortest_loop
  ldp x12, x13, [sp, #0x90]
  ldp x28, x29, [sp, #0x80]
  ldp x26, x27, [sp, #0x70]
  ldp x24, x25, [sp, #0x60]
  ldp x22, x23, [sp, #0x50]
  ldp x20, x21, [sp, #0x40]
  ldp x18, x19, [sp, #0x30]
  ldp x16, x17, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0xa0
  ret 

_cmptest:
cmptest:
  sub sp, sp, #0xa0
  stp x14, x15, [sp, #0x10]
  stp x16, x17, [sp, #0x20]
  stp x18, x19, [sp, #0x30]
  stp x20, x21, [sp, #0x40]
  stp x22, x23, [sp, #0x50]
  stp x24, x25, [sp, #0x60]
  stp x26, x27, [sp, #0x70]
  stp x28, x29, [sp, #0x80]
  stp x12, x13, [sp, #0x90]
  mov x15, 1
  mov x14, 32
  eor x16,x16,x16
  eor x17,x17,x17
  eor x18,x18,x18
  eor x19,x19,x19
  eor x20,x20,x20
  eor x21,x21,x21
  eor x22,x22,x22
  eor x23,x23,x23
  eor x24,x24,x24
  eor x25,x25,x25
  eor x26,x26,x26
  eor x27,x27,x27
  eor x28,x28,x28
  eor x29,x29,x29
  eor x12,x12,x12
  eor x13,x13,x13
cmptest_loop:
  cmp x12,x12
  cmp x13,x13
  cmp x16,x16
  cmp x17,x17
  cmp x18,x18
  cmp x19,x19
  cmp x20,x20
  cmp x21,x21
  cmp x22,x22
  cmp x23,x23
  cmp x24,x24
  cmp x25,x25
  cmp x26,x26
  cmp x27,x27
  cmp x28,x28
  cmp x29,x29
  cmp x12,x12
  cmp x13,x13
  cmp x16,x16
  cmp x17,x17
  cmp x18,x18
  cmp x19,x19
  cmp x20,x20
  cmp x21,x21
  cmp x22,x22
  cmp x23,x23
  cmp x24,x24
  cmp x25,x25
  cmp x26,x26
  cmp x27,x27
  cmp x28,x28
  cmp x29,x29
  sub x0, x0, x14
  cbnz x0, cmptest_loop
  ldp x12, x13, [sp, #0x90]
  ldp x28, x29, [sp, #0x80]
  ldp x26, x27, [sp, #0x70]
  ldp x24, x25, [sp, #0x60]
  ldp x22, x23, [sp, #0x50]
  ldp x20, x21, [sp, #0x40]
  ldp x18, x19, [sp, #0x30]
  ldp x16, x17, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0xa0
  ret 

_addmultest:
addmultest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 20
  mov x13, 2
  eor x12, x12, x12
  mov x11, 2
  eor x10, x10, x10
  mov x9, 2
  mov x8, 2
addmultest_loop:
  mul w13, w13, w15
  add x12, x12, x15
  mul w11, w11, w15
  add x10, x10, x15
  mul w9, w9, w15
  add x12, x12, x15
  mul w8, w8, w15
  add x10, x10, x15
  mul w13, w13, w15
  add x12, x12, x15
  mul w11, w11, w15
  add x10, x10, x15
  mul w9, w9, w15
  add x12, x12, x15
  mul w8, w8, w15
  add x10, x10, x15
  mul w13, w13, w15
  add x12, x12, x15
  mul w11, w11, w15
  add x10, x10, x15
  sub x0, x0, x14
  cbnz x0, addmultest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_addmul21test:
addmul21test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 24
  mov x13, 2
  eor x12, x12, x12
  mov x11, 2
  eor x10, x10, x10
  mov x9, 2
  mov x8, 2
addmul21test_loop:
  mul w13, w13, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w11, w11, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w9, w9, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w8, w8, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w13, w13, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w11, w11, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w9, w9, w15
  add x12, x12, x15
  add x10, x10, x15
  mul w8, w8, w15
  add x12, x12, x15
  add x10, x10, x15
  sub x0, x0, x14
  cmp x0, 0
  b.gt addmul21test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret 

_mul32test:
mul32test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 20
  mov x13, x15
  mov x12, x15
  mov x11, x15
  mov x10, x15
  mov x9, x15
  mov x8, x15
mul32test_loop:
  mul w13, w13, w15
  mul w12, w12, w15
  mul w11, w11, w15
  mul w10, w10, w15
  mul w9, w9, w15
  mul w8, w8, w15
  mul w13, w13, w15
  mul w12, w12, w15
  mul w11, w11, w15
  mul w10, w10, w15
  mul w9, w9, w15
  mul w8, w8, w15
  mul w13, w13, w15
  mul w12, w12, w15
  mul w11, w11, w15
  mul w10, w10, w15
  mul w9, w9, w15
  mul w8, w8, w15
  mul w13, w13, w15
  mul w12, w12, w15
  sub x0, x0, x14
  cbnz x0, mul32test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mul64test:
mul64test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 20
  mov x13, x15
  mov x12, x15
  mov x11, x15
  mov x10, x15
  mov x9, x15
  mov x8, x15
mul64test_loop:
  mul x13, x13, x15
  mul x12, x12, x15
  mul x11, x11, x15
  mul x10, x10, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x13, x13, x15
  mul x12, x12, x15
  mul x11, x11, x15
  mul x10, x10, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x13, x13, x15
  mul x12, x12, x15
  mul x11, x11, x15
  mul x10, x10, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x13, x13, x15
  mul x12, x12, x15
  sub x0, x0, x14
  cbnz x0, mul64test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_latmul64test:
latmul64test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 20
  mov x13, x15
latmul64test_loop:
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  mul x13, x13, x13
  sub x0, x0, x14
  cbnz x0, latmul64test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

/* needs an additional parameter passed in x1 - ptr to array of 4 floats */
_vecadd128test:
vecadd128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecadd128test_loop:
  add v0.4s,v0.4s,v0.4s
  add v1.4s,v1.4s,v1.4s
  add v2.4s,v2.4s,v2.4s
  add v3.4s,v3.4s,v3.4s
  add v4.4s,v4.4s,v4.4s
  add v5.4s,v5.4s,v5.4s
  add v6.4s,v6.4s,v6.4s
  add v7.4s,v7.4s,v7.4s
  add v8.4s,v8.4s,v8.4s
  add v9.4s,v9.4s,v9.4s
  add v10.4s,v10.4s,v10.4s
  add v11.4s,v11.4s,v11.4s
  add v12.4s,v12.4s,v12.4s
  add v13.4s,v13.4s,v13.4s
  add v14.4s,v14.4s,v14.4s
  add v15.4s,v15.4s,v15.4s
  add v16.4s,v16.4s,v16.4s
  add v17.4s,v17.4s,v17.4s
  add v18.4s,v18.4s,v18.4s
  add v19.4s,v19.4s,v19.4s
  add v20.4s,v20.4s,v20.4s
  add v21.4s,v21.4s,v21.4s
  add v22.4s,v22.4s,v22.4s
  add v23.4s,v23.4s,v23.4s
  add v24.4s,v24.4s,v24.4s
  add v25.4s,v25.4s,v25.4s
  add v26.4s,v26.4s,v26.4s
  add v27.4s,v27.4s,v27.4s
  add v28.4s,v28.4s,v28.4s
  add v29.4s,v29.4s,v29.4s
  add v30.4s,v30.4s,v30.4s
  add v31.4s,v31.4s,v31.4s
  sub x0, x0, x14
  cbnz x0, vecadd128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latvecadd128test:
latvecadd128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latvecadd128test_loop:
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  add v16.4s, v16.4s, v16.4s
  sub x0, x0, x14
  cbnz x0, latvecadd128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_faddtest:
faddtest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
faddtest_loop:
  fadd s0,s0,s0
  fadd s1,s1,s1
  fadd s2,s2,s2
  fadd s3,s3,s3
  fadd s4,s4,s4
  fadd s5,s5,s5
  fadd s6,s6,s6
  fadd s7,s7,s7
  fadd s8,s8,s8
  fadd s9,s9,s9
  fadd s10,s10,s10
  fadd s11,s11,s11
  fadd s12,s12,s12
  fadd s13,s13,s13
  fadd s14,s14,s14
  fadd s15,s15,s15
  fadd s16,s16,s16
  fadd s17,s17,s17
  fadd s18,s18,s18
  fadd s19,s19,s19
  fadd s20,s20,s20
  fadd s21,s21,s21
  fadd s22,s22,s22
  fadd s23,s23,s23
  fadd s24,s24,s24
  fadd s25,s25,s25
  fadd s26,s26,s26
  fadd s27,s27,s27
  fadd s28,s28,s28
  fadd s29,s29,s29
  fadd s30,s30,s30
  fadd s31,s31,s31
  sub x0, x0, x14
  cbnz x0, faddtest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latfaddtest:
latfaddtest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr s16, [x1]
latfaddtest_loop:
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  fadd s16, s16, s16
  sub x0, x0, x14
  cbnz x0, latfaddtest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latfmultest:
latfmultest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr s16, [x1]
latfmultest_loop:
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  fmul s16, s16, s16
  sub x0, x0, x14
  cbnz x0, latfmultest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latvecmul128test:
latvecmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latvecmul128test_loop:
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  mul v16.4s, v16.4s, v16.4s
  sub x0, x0, x14
  cbnz x0, latvecmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecmul128test:
vecmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecmul128test_loop:
  mul v0.4s,v0.4s,v0.4s
  mul v1.4s,v1.4s,v1.4s
  mul v2.4s,v2.4s,v2.4s
  mul v3.4s,v3.4s,v3.4s
  mul v4.4s,v4.4s,v4.4s
  mul v5.4s,v5.4s,v5.4s
  mul v6.4s,v6.4s,v6.4s
  mul v7.4s,v7.4s,v7.4s
  mul v8.4s,v8.4s,v8.4s
  mul v9.4s,v9.4s,v9.4s
  mul v10.4s,v10.4s,v10.4s
  mul v11.4s,v11.4s,v11.4s
  mul v12.4s,v12.4s,v12.4s
  mul v13.4s,v13.4s,v13.4s
  mul v14.4s,v14.4s,v14.4s
  mul v15.4s,v15.4s,v15.4s
  mul v16.4s,v16.4s,v16.4s
  mul v17.4s,v17.4s,v17.4s
  mul v18.4s,v18.4s,v18.4s
  mul v19.4s,v19.4s,v19.4s
  mul v20.4s,v20.4s,v20.4s
  mul v21.4s,v21.4s,v21.4s
  mul v22.4s,v22.4s,v22.4s
  mul v23.4s,v23.4s,v23.4s
  mul v24.4s,v24.4s,v24.4s
  mul v25.4s,v25.4s,v25.4s
  mul v26.4s,v26.4s,v26.4s
  mul v27.4s,v27.4s,v27.4s
  mul v28.4s,v28.4s,v28.4s
  mul v29.4s,v29.4s,v29.4s
  mul v30.4s,v30.4s,v30.4s
  mul v31.4s,v31.4s,v31.4s
  sub x0, x0, x14
  cbnz x0, vecmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_scalarfmatest:
scalarfmatest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
scalarfmatest_loop:
  fmadd s0,s0,s0,s0
  fmadd s1,s1,s1,s1
  fmadd s2,s2,s2,s2
  fmadd s3,s3,s3,s3
  fmadd s4,s4,s4,s4
  fmadd s5,s5,s5,s5
  fmadd s6,s6,s6,s6
  fmadd s7,s7,s7,s7
  fmadd s8,s8,s8,s8
  fmadd s9,s9,s9,s9
  fmadd s10,s10,s10,s10
  fmadd s11,s11,s11,s11
  fmadd s12,s12,s12,s12
  fmadd s13,s13,s13,s13
  fmadd s14,s14,s14,s14
  fmadd s15,s15,s15,s15
  fmadd s16,s16,s16,s16
  fmadd s17,s17,s17,s17
  fmadd s18,s18,s18,s18
  fmadd s19,s19,s19,s19
  fmadd s20,s20,s20,s20
  fmadd s21,s21,s21,s21
  fmadd s22,s22,s22,s22
  fmadd s23,s23,s23,s23
  fmadd s24,s24,s24,s24
  fmadd s25,s25,s25,s25
  fmadd s26,s26,s26,s26
  fmadd s27,s27,s27,s27
  fmadd s28,s28,s28,s28
  fmadd s29,s29,s29,s29
  fmadd s30,s30,s30,s30
  fmadd s31,s31,s31,s31
  sub x0, x0, x14
  cbnz x0, scalarfmatest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latscalarfmatest:
latscalarfmatest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latscalarfmatest_loop:
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  fmadd s16, s16, s16, s16
  sub x0, x0, x14
  cbnz x0, latscalarfmatest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecfma128test:
vecfma128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecfma128test_loop:
  fmla v0.4s,v0.4s,v0.4s
  fmla v1.4s,v1.4s,v1.4s
  fmla v2.4s,v2.4s,v2.4s
  fmla v3.4s,v3.4s,v3.4s
  fmla v4.4s,v4.4s,v4.4s
  fmla v5.4s,v5.4s,v5.4s
  fmla v6.4s,v6.4s,v6.4s
  fmla v7.4s,v7.4s,v7.4s
  fmla v8.4s,v8.4s,v8.4s
  fmla v9.4s,v9.4s,v9.4s
  fmla v10.4s,v10.4s,v10.4s
  fmla v11.4s,v11.4s,v11.4s
  fmla v12.4s,v12.4s,v12.4s
  fmla v13.4s,v13.4s,v13.4s
  fmla v14.4s,v14.4s,v14.4s
  fmla v15.4s,v15.4s,v15.4s
  fmla v16.4s,v16.4s,v16.4s
  fmla v17.4s,v17.4s,v17.4s
  fmla v18.4s,v18.4s,v18.4s
  fmla v19.4s,v19.4s,v19.4s
  fmla v20.4s,v20.4s,v20.4s
  fmla v21.4s,v21.4s,v21.4s
  fmla v22.4s,v22.4s,v22.4s
  fmla v23.4s,v23.4s,v23.4s
  fmla v24.4s,v24.4s,v24.4s
  fmla v25.4s,v25.4s,v25.4s
  fmla v26.4s,v26.4s,v26.4s
  fmla v27.4s,v27.4s,v27.4s
  fmla v28.4s,v28.4s,v28.4s
  fmla v29.4s,v29.4s,v29.4s
  fmla v30.4s,v30.4s,v30.4s
  fmla v31.4s,v31.4s,v31.4s
  sub x0, x0, x14
  cbnz x0, vecfma128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixvecfmulfma128test:
mixvecfmulfma128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 64
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
mixvecfmulfma128test_loop:
  fmul v0.4s,v0.4s,v0.4s
  fmla v31.4s,v31.4s,v31.4s
  fmul v1.4s,v1.4s,v1.4s
  fmla v30.4s,v30.4s,v30.4s
  fmul v2.4s,v2.4s,v2.4s
  fmla v29.4s,v29.4s,v29.4s
  fmul v3.4s,v3.4s,v3.4s
  fmla v28.4s,v28.4s,v28.4s
  fmul v4.4s,v4.4s,v4.4s
  fmla v27.4s,v27.4s,v27.4s
  fmul v5.4s,v5.4s,v5.4s
  fmla v26.4s,v26.4s,v26.4s
  fmul v6.4s,v6.4s,v6.4s
  fmla v25.4s,v25.4s,v25.4s
  fmul v7.4s,v7.4s,v7.4s
  fmla v24.4s,v24.4s,v24.4s
  fmul v8.4s,v8.4s,v8.4s
  fmla v23.4s,v23.4s,v23.4s
  fmul v9.4s,v9.4s,v9.4s
  fmla v22.4s,v22.4s,v22.4s
  fmul v10.4s,v10.4s,v10.4s
  fmla v21.4s,v21.4s,v21.4s
  fmul v11.4s,v11.4s,v11.4s
  fmla v20.4s,v20.4s,v20.4s
  fmul v12.4s,v12.4s,v12.4s
  fmla v19.4s,v19.4s,v19.4s
  fmul v13.4s,v13.4s,v13.4s
  fmla v18.4s,v18.4s,v18.4s
  fmul v14.4s,v14.4s,v14.4s
  fmla v17.4s,v17.4s,v17.4s
  fmul v15.4s,v15.4s,v15.4s
  fmla v16.4s,v16.4s,v16.4s
  fmul v16.4s,v16.4s,v16.4s
  fmla v15.4s,v15.4s,v15.4s
  fmul v17.4s,v17.4s,v17.4s
  fmla v14.4s,v14.4s,v14.4s
  fmul v18.4s,v18.4s,v18.4s
  fmla v13.4s,v13.4s,v13.4s
  fmul v19.4s,v19.4s,v19.4s
  fmla v12.4s,v12.4s,v12.4s
  fmul v20.4s,v20.4s,v20.4s
  fmla v11.4s,v11.4s,v11.4s
  fmul v21.4s,v21.4s,v21.4s
  fmla v10.4s,v10.4s,v10.4s
  fmul v22.4s,v22.4s,v22.4s
  fmla v9.4s,v9.4s,v9.4s
  fmul v23.4s,v23.4s,v23.4s
  fmla v8.4s,v8.4s,v8.4s
  fmul v24.4s,v24.4s,v24.4s
  fmla v7.4s,v7.4s,v7.4s
  fmul v25.4s,v25.4s,v25.4s
  fmla v6.4s,v6.4s,v6.4s
  fmul v26.4s,v26.4s,v26.4s
  fmla v5.4s,v5.4s,v5.4s
  fmul v27.4s,v27.4s,v27.4s
  fmla v4.4s,v4.4s,v4.4s
  fmul v28.4s,v28.4s,v28.4s
  fmla v3.4s,v3.4s,v3.4s
  fmul v29.4s,v29.4s,v29.4s
  fmla v2.4s,v2.4s,v2.4s
  fmul v30.4s,v30.4s,v30.4s
  fmla v1.4s,v1.4s,v1.4s
  fmul v31.4s,v31.4s,v31.4s
  fmla v0.4s,v0.4s,v0.4s
  sub x0, x0, x14
  cbnz x0, mixvecfmulfma128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixvecfaddfma128test:
mixvecfaddfma128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 64
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
mixvecfaddfma128test_loop:
  fadd v0.4s,v0.4s,v0.4s
  fmla v31.4s,v31.4s,v31.4s
  fadd v1.4s,v1.4s,v1.4s
  fmla v30.4s,v30.4s,v30.4s
  fadd v2.4s,v2.4s,v2.4s
  fmla v29.4s,v29.4s,v29.4s
  fadd v3.4s,v3.4s,v3.4s
  fmla v28.4s,v28.4s,v28.4s
  fadd v4.4s,v4.4s,v4.4s
  fmla v27.4s,v27.4s,v27.4s
  fadd v5.4s,v5.4s,v5.4s
  fmla v26.4s,v26.4s,v26.4s
  fadd v6.4s,v6.4s,v6.4s
  fmla v25.4s,v25.4s,v25.4s
  fadd v7.4s,v7.4s,v7.4s
  fmla v24.4s,v24.4s,v24.4s
  fadd v8.4s,v8.4s,v8.4s
  fmla v23.4s,v23.4s,v23.4s
  fadd v9.4s,v9.4s,v9.4s
  fmla v22.4s,v22.4s,v22.4s
  fadd v10.4s,v10.4s,v10.4s
  fmla v21.4s,v21.4s,v21.4s
  fadd v11.4s,v11.4s,v11.4s
  fmla v20.4s,v20.4s,v20.4s
  fadd v12.4s,v12.4s,v12.4s
  fmla v19.4s,v19.4s,v19.4s
  fadd v13.4s,v13.4s,v13.4s
  fmla v18.4s,v18.4s,v18.4s
  fadd v14.4s,v14.4s,v14.4s
  fmla v17.4s,v17.4s,v17.4s
  fadd v15.4s,v15.4s,v15.4s
  fmla v16.4s,v16.4s,v16.4s
  fadd v16.4s,v16.4s,v16.4s
  fmla v15.4s,v15.4s,v15.4s
  fadd v17.4s,v17.4s,v17.4s
  fmla v14.4s,v14.4s,v14.4s
  fadd v18.4s,v18.4s,v18.4s
  fmla v13.4s,v13.4s,v13.4s
  fadd v19.4s,v19.4s,v19.4s
  fmla v12.4s,v12.4s,v12.4s
  fadd v20.4s,v20.4s,v20.4s
  fmla v11.4s,v11.4s,v11.4s
  fadd v21.4s,v21.4s,v21.4s
  fmla v10.4s,v10.4s,v10.4s
  fadd v22.4s,v22.4s,v22.4s
  fmla v9.4s,v9.4s,v9.4s
  fadd v23.4s,v23.4s,v23.4s
  fmla v8.4s,v8.4s,v8.4s
  fadd v24.4s,v24.4s,v24.4s
  fmla v7.4s,v7.4s,v7.4s
  fadd v25.4s,v25.4s,v25.4s
  fmla v6.4s,v6.4s,v6.4s
  fadd v26.4s,v26.4s,v26.4s
  fmla v5.4s,v5.4s,v5.4s
  fadd v27.4s,v27.4s,v27.4s
  fmla v4.4s,v4.4s,v4.4s
  fadd v28.4s,v28.4s,v28.4s
  fmla v3.4s,v3.4s,v3.4s
  fadd v29.4s,v29.4s,v29.4s
  fmla v2.4s,v2.4s,v2.4s
  fadd v30.4s,v30.4s,v30.4s
  fmla v1.4s,v1.4s,v1.4s
  fadd v31.4s,v31.4s,v31.4s
  fmla v0.4s,v0.4s,v0.4s
  sub x0, x0, x14
  cbnz x0, mixvecfaddfma128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latvecfma128test:
latvecfma128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latvecfma128test_loop:
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  fmla v16.4s, v16.4s, v16.4s
  sub x0, x0, x14
  cbnz x0, latvecfma128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecfadd128test:
vecfadd128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecfadd128test_loop:
  fadd v0.4s,v0.4s,v0.4s
  fadd v1.4s,v1.4s,v1.4s
  fadd v2.4s,v2.4s,v2.4s
  fadd v3.4s,v3.4s,v3.4s
  fadd v4.4s,v4.4s,v4.4s
  fadd v5.4s,v5.4s,v5.4s
  fadd v6.4s,v6.4s,v6.4s
  fadd v7.4s,v7.4s,v7.4s
  fadd v8.4s,v8.4s,v8.4s
  fadd v9.4s,v9.4s,v9.4s
  fadd v10.4s,v10.4s,v10.4s
  fadd v11.4s,v11.4s,v11.4s
  fadd v12.4s,v12.4s,v12.4s
  fadd v13.4s,v13.4s,v13.4s
  fadd v14.4s,v14.4s,v14.4s
  fadd v15.4s,v15.4s,v15.4s
  fadd v16.4s,v16.4s,v16.4s
  fadd v17.4s,v17.4s,v17.4s
  fadd v18.4s,v18.4s,v18.4s
  fadd v19.4s,v19.4s,v19.4s
  fadd v20.4s,v20.4s,v20.4s
  fadd v21.4s,v21.4s,v21.4s
  fadd v22.4s,v22.4s,v22.4s
  fadd v23.4s,v23.4s,v23.4s
  fadd v24.4s,v24.4s,v24.4s
  fadd v25.4s,v25.4s,v25.4s
  fadd v26.4s,v26.4s,v26.4s
  fadd v27.4s,v27.4s,v27.4s
  fadd v28.4s,v28.4s,v28.4s
  fadd v29.4s,v29.4s,v29.4s
  fadd v30.4s,v30.4s,v30.4s
  fadd v31.4s,v31.4s,v31.4s
  sub x0, x0, x14
  cbnz x0, vecfadd128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latvecfadd128test:
latvecfadd128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latvecfadd128test_loop:
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  fadd v16.4s, v16.4s, v16.4s
  sub x0, x0, x14
  cbnz x0, latvecfadd128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecfmul128test:
vecfmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecfmul128test_loop:
  fmul v0.4s,v0.4s,v0.4s
  fmul v1.4s,v1.4s,v1.4s
  fmul v2.4s,v2.4s,v2.4s
  fmul v3.4s,v3.4s,v3.4s
  fmul v4.4s,v4.4s,v4.4s
  fmul v5.4s,v5.4s,v5.4s
  fmul v6.4s,v6.4s,v6.4s
  fmul v7.4s,v7.4s,v7.4s
  fmul v8.4s,v8.4s,v8.4s
  fmul v9.4s,v9.4s,v9.4s
  fmul v10.4s,v10.4s,v10.4s
  fmul v11.4s,v11.4s,v11.4s
  fmul v12.4s,v12.4s,v12.4s
  fmul v13.4s,v13.4s,v13.4s
  fmul v14.4s,v14.4s,v14.4s
  fmul v15.4s,v15.4s,v15.4s
  fmul v16.4s,v16.4s,v16.4s
  fmul v17.4s,v17.4s,v17.4s
  fmul v18.4s,v18.4s,v18.4s
  fmul v19.4s,v19.4s,v19.4s
  fmul v20.4s,v20.4s,v20.4s
  fmul v21.4s,v21.4s,v21.4s
  fmul v22.4s,v22.4s,v22.4s
  fmul v23.4s,v23.4s,v23.4s
  fmul v24.4s,v24.4s,v24.4s
  fmul v25.4s,v25.4s,v25.4s
  fmul v26.4s,v26.4s,v26.4s
  fmul v27.4s,v27.4s,v27.4s
  fmul v28.4s,v28.4s,v28.4s
  fmul v29.4s,v29.4s,v29.4s
  fmul v30.4s,v30.4s,v30.4s
  fmul v31.4s,v31.4s,v31.4s
  sub x0, x0, x14
  cbnz x0, vecfmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_latvecfmul128test:
latvecfmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
latvecfmul128test_loop:
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  fmul v16.4s, v16.4s, v16.4s
  sub x0, x0, x14
  cbnz x0, latvecfmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixvecfaddfmul128test:
mixvecfaddfmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 64
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
mixvecfaddfmul128test_loop:
  fadd v0.4s,v0.4s,v0.4s
  fmul v31.4s,v31.4s,v31.4s
  fadd v1.4s,v1.4s,v1.4s
  fmul v30.4s,v30.4s,v30.4s
  fadd v2.4s,v2.4s,v2.4s
  fmul v29.4s,v29.4s,v29.4s
  fadd v3.4s,v3.4s,v3.4s
  fmul v28.4s,v28.4s,v28.4s
  fadd v4.4s,v4.4s,v4.4s
  fmul v27.4s,v27.4s,v27.4s
  fadd v5.4s,v5.4s,v5.4s
  fmul v26.4s,v26.4s,v26.4s
  fadd v6.4s,v6.4s,v6.4s
  fmul v25.4s,v25.4s,v25.4s
  fadd v7.4s,v7.4s,v7.4s
  fmul v24.4s,v24.4s,v24.4s
  fadd v8.4s,v8.4s,v8.4s
  fmul v23.4s,v23.4s,v23.4s
  fadd v9.4s,v9.4s,v9.4s
  fmul v22.4s,v22.4s,v22.4s
  fadd v10.4s,v10.4s,v10.4s
  fmul v21.4s,v21.4s,v21.4s
  fadd v11.4s,v11.4s,v11.4s
  fmul v20.4s,v20.4s,v20.4s
  fadd v12.4s,v12.4s,v12.4s
  fmul v19.4s,v19.4s,v19.4s
  fadd v13.4s,v13.4s,v13.4s
  fmul v18.4s,v18.4s,v18.4s
  fadd v14.4s,v14.4s,v14.4s
  fmul v17.4s,v17.4s,v17.4s
  fadd v15.4s,v15.4s,v15.4s
  fmul v16.4s,v16.4s,v16.4s
  fadd v16.4s,v16.4s,v16.4s
  fmul v15.4s,v15.4s,v15.4s
  fadd v17.4s,v17.4s,v17.4s
  fmul v14.4s,v14.4s,v14.4s
  fadd v18.4s,v18.4s,v18.4s
  fmul v13.4s,v13.4s,v13.4s
  fadd v19.4s,v19.4s,v19.4s
  fmul v12.4s,v12.4s,v12.4s
  fadd v20.4s,v20.4s,v20.4s
  fmul v11.4s,v11.4s,v11.4s
  fadd v21.4s,v21.4s,v21.4s
  fmul v10.4s,v10.4s,v10.4s
  fadd v22.4s,v22.4s,v22.4s
  fmul v9.4s,v9.4s,v9.4s
  fadd v23.4s,v23.4s,v23.4s
  fmul v8.4s,v8.4s,v8.4s
  fadd v24.4s,v24.4s,v24.4s
  fmul v7.4s,v7.4s,v7.4s
  fadd v25.4s,v25.4s,v25.4s
  fmul v6.4s,v6.4s,v6.4s
  fadd v26.4s,v26.4s,v26.4s
  fmul v5.4s,v5.4s,v5.4s
  fadd v27.4s,v27.4s,v27.4s
  fmul v4.4s,v4.4s,v4.4s
  fadd v28.4s,v28.4s,v28.4s
  fmul v3.4s,v3.4s,v3.4s
  fadd v29.4s,v29.4s,v29.4s
  fmul v2.4s,v2.4s,v2.4s
  fadd v30.4s,v30.4s,v30.4s
  fmul v1.4s,v1.4s,v1.4s
  fadd v31.4s,v31.4s,v31.4s
  fmul v0.4s,v0.4s,v0.4s
  sub x0, x0, x14
  cbnz x0, mixvecfaddfmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixvecaddmul128test:
mixvecaddmul128test:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 64
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
mixvecaddmul128test_loop:
  add v0.4s,v0.4s,v0.4s
  mul v31.4s,v31.4s,v31.4s
  add v1.4s,v1.4s,v1.4s
  mul v30.4s,v30.4s,v30.4s
  add v2.4s,v2.4s,v2.4s
  mul v29.4s,v29.4s,v29.4s
  add v3.4s,v3.4s,v3.4s
  mul v28.4s,v28.4s,v28.4s
  add v4.4s,v4.4s,v4.4s
  mul v27.4s,v27.4s,v27.4s
  add v5.4s,v5.4s,v5.4s
  mul v26.4s,v26.4s,v26.4s
  add v6.4s,v6.4s,v6.4s
  mul v25.4s,v25.4s,v25.4s
  add v7.4s,v7.4s,v7.4s
  mul v24.4s,v24.4s,v24.4s
  add v8.4s,v8.4s,v8.4s
  mul v23.4s,v23.4s,v23.4s
  add v9.4s,v9.4s,v9.4s
  mul v22.4s,v22.4s,v22.4s
  add v10.4s,v10.4s,v10.4s
  mul v21.4s,v21.4s,v21.4s
  add v11.4s,v11.4s,v11.4s
  mul v20.4s,v20.4s,v20.4s
  add v12.4s,v12.4s,v12.4s
  mul v19.4s,v19.4s,v19.4s
  add v13.4s,v13.4s,v13.4s
  mul v18.4s,v18.4s,v18.4s
  add v14.4s,v14.4s,v14.4s
  mul v17.4s,v17.4s,v17.4s
  add v15.4s,v15.4s,v15.4s
  mul v16.4s,v16.4s,v16.4s
  add v16.4s,v16.4s,v16.4s
  mul v15.4s,v15.4s,v15.4s
  add v17.4s,v17.4s,v17.4s
  mul v14.4s,v14.4s,v14.4s
  add v18.4s,v18.4s,v18.4s
  mul v13.4s,v13.4s,v13.4s
  add v19.4s,v19.4s,v19.4s
  mul v12.4s,v12.4s,v12.4s
  add v20.4s,v20.4s,v20.4s
  mul v11.4s,v11.4s,v11.4s
  add v21.4s,v21.4s,v21.4s
  mul v10.4s,v10.4s,v10.4s
  add v22.4s,v22.4s,v22.4s
  mul v9.4s,v9.4s,v9.4s
  add v23.4s,v23.4s,v23.4s
  mul v8.4s,v8.4s,v8.4s
  add v24.4s,v24.4s,v24.4s
  mul v7.4s,v7.4s,v7.4s
  add v25.4s,v25.4s,v25.4s
  mul v6.4s,v6.4s,v6.4s
  add v26.4s,v26.4s,v26.4s
  mul v5.4s,v5.4s,v5.4s
  add v27.4s,v27.4s,v27.4s
  mul v4.4s,v4.4s,v4.4s
  add v28.4s,v28.4s,v28.4s
  mul v3.4s,v3.4s,v3.4s
  add v29.4s,v29.4s,v29.4s
  mul v2.4s,v2.4s,v2.4s
  add v30.4s,v30.4s,v30.4s
  mul v1.4s,v1.4s,v1.4s
  add v31.4s,v31.4s,v31.4s
  mul v0.4s,v0.4s,v0.4s
  sub x0, x0, x14
  cbnz x0, mixvecaddmul128test_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixaddvecadd128test:
mixaddvecadd128test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 30
  eor x13, x13, x13
  eor x12, x12, x12
  eor x11, x11, x11
  eor x10, x10, x10
  eor x9, x9, x9
  eor x8, x8, x8
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
mixaddvecadd128test_loop:
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add x10, x10, x15
  add v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add x10, x10, x15
  add v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add x10, x10, x15
  add v20.4s, v20.4s, v20.4s
  add v21.4s, v21.4s, v21.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add x10, x10, x15
  add v20.4s, v20.4s, v20.4s
  add v21.4s, v21.4s, v21.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add x10, x10, x15
  add v22.4s, v22.4s, v22.4s
  add v23.4s, v23.4s, v23.4s
  sub x0, x0, x14
  cbnz x0, mixaddvecadd128test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mix3to1addvecadd128test:
mix3to1addvecadd128test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 40
  eor x13, x13, x13
  eor x12, x12, x12
  eor x11, x11, x11
  eor x10, x10, x10
  eor x9, x9, x9
  eor x8, x8, x8
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
mix3to1addvecadd128test_loop:
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v16.4s, v16.4s, v16.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v17.4s, v17.4s, v17.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v19.4s, v19.4s, v19.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v20.4s, v20.4s, v20.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v16.4s, v16.4s, v16.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v17.4s, v17.4s, v17.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v19.4s, v19.4s, v19.4s
  add x13, x13, x15
  add x12, x12, x15
  add x11, x11, x15
  add v20.4s, v20.4s, v20.4s
  sub x0, x0, x14
  cbnz x0, mix3to1addvecadd128test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mix1to1addvecadd128test:
mix1to1addvecadd128test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 40
  eor x13, x13, x13
  eor x12, x12, x12
  eor x11, x11, x11
  eor x10, x10, x10
  eor x9, x9, x9
  eor x8, x8, x8
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
mix1to1addvecadd128test_loop:
  add x13, x13, x15
  add v16.4s, v16.4s, v16.4s
  add x12, x12, x15
  add v17.4s, v17.4s, v17.4s
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x10, x10, x15
  add v19.4s, v19.4s, v19.4s

  add x13, x13, x15
  add v16.4s, v16.4s, v16.4s
  add x12, x12, x15
  add v17.4s, v17.4s, v17.4s
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x10, x10, x15
  add v19.4s, v19.4s, v19.4s

  add x13, x13, x15
  add v16.4s, v16.4s, v16.4s
  add x12, x12, x15
  add v17.4s, v17.4s, v17.4s
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x10, x10, x15
  add v19.4s, v19.4s, v19.4s

  add x13, x13, x15
  add v16.4s, v16.4s, v16.4s
  add x12, x12, x15
  add v17.4s, v17.4s, v17.4s
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x10, x10, x15
  add v19.4s, v19.4s, v19.4s

  add x13, x13, x15
  add v16.4s, v16.4s, v16.4s
  add x12, x12, x15
  add v17.4s, v17.4s, v17.4s
  add x11, x11, x15
  add v18.4s, v18.4s, v18.4s
  add x10, x10, x15
  add v19.4s, v19.4s, v19.4s

  sub x0, x0, x14
  cbnz x0, mix1to1addvecadd128test_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixmulvecmultest:
mixmulvecmultest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 2
  mov x14, 20
  mov x13, x15
  mov x12, x15
  mov x11, x15
  mov x10, x15
  mov x9, x15
  mov x8, x15
  mov x7, x15
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
mixmulvecmultest_loop:
  mul w8, w8, w15
  mul v16.4s, v16.4s, v16.4s
  mul w9, w9, w15
  mul v17.4s, v17.4s, v17.4s
  mul w10, w10, w15
  mul v18.4s, v18.4s, v18.4s
  mul w11, w11, w15
  mul v19.4s, v19.4s, v19.4s
  mul w12, w12, w15
  mul v20.4s, v20.4s, v20.4s
  mul w8, w8, w15
  mul v16.4s, v16.4s, v16.4s
  mul w9, w9, w15
  mul v17.4s, v17.4s, v17.4s
  mul w10, w10, w15
  mul v18.4s, v18.4s, v18.4s
  mul w11, w11, w15
  mul v19.4s, v19.4s, v19.4s
  mul w12, w12, w15
  mul v20.4s, v20.4s, v20.4s
  sub x0, x0, x14
  cbnz x0, mixmulvecmultest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixvecmulfmultest:
mixvecmulfmultest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
  ldr q17, [x2]
  ldr q18, [x1]
  ldr q19, [x2]
  ldr q20, [x1]
  ldr q21, [x2]
mixvecmulfmultest_loop:
  fmul v16.4s, v16.4s, v16.4s
  mul v17.4s, v17.4s, v17.4s
  fmul v18.4s, v18.4s, v18.4s
  mul v19.4s, v19.4s, v19.4s
  fmul v20.4s, v20.4s, v20.4s
  mul v21.4s, v21.4s, v21.4s
  fmul v16.4s, v16.4s, v16.4s
  mul v17.4s, v17.4s, v17.4s
  fmul v18.4s, v18.4s, v18.4s
  mul v19.4s, v19.4s, v19.4s
  fmul v20.4s, v20.4s, v20.4s
  mul v21.4s, v21.4s, v21.4s
  fmul v16.4s, v16.4s, v16.4s
  mul v17.4s, v17.4s, v17.4s
  fmul v18.4s, v18.4s, v18.4s
  mul v19.4s, v19.4s, v19.4s
  fmul v20.4s, v20.4s, v20.4s
  mul v21.4s, v21.4s, v21.4s
  fmul v16.4s, v16.4s, v16.4s
  mul v17.4s, v17.4s, v17.4s
  sub x0, x0, x14
  cbnz x0, mixvecmulfmultest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixvecaddfaddtest:
mixvecaddfaddtest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
  ldr q17, [x2]
  ldr q18, [x1]
  ldr q19, [x2]
  ldr q20, [x1]
  ldr q21, [x2]
mixvecaddfaddtest_loop:
  fadd v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  fadd v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  fadd v20.4s, v20.4s, v20.4s
  add v21.4s, v21.4s, v21.4s
  fadd v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  fadd v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  fadd v20.4s, v20.4s, v20.4s
  add v21.4s, v21.4s, v21.4s
  fadd v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  fadd v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  fadd v20.4s, v20.4s, v20.4s
  add v21.4s, v21.4s, v21.4s
  fadd v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  sub x0, x0, x14
  cbnz x0, mixvecaddfaddtest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixjmpvecaddtest:
mixjmpvecaddtest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 30
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
mixjmpvecaddtest_loop:
  add v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v20.4s, v20.4s, v20.4s
  add v16.4s, v16.4s, v16.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v17.4s, v17.4s, v17.4s
  add v18.4s, v18.4s, v18.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v19.4s, v19.4s, v19.4s
  add v20.4s, v20.4s, v20.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v16.4s, v16.4s, v16.4s
  add v17.4s, v17.4s, v17.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v18.4s, v18.4s, v18.4s
  add v19.4s, v19.4s, v19.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v20.4s, v20.4s, v20.4s
  add v16.4s, v16.4s, v16.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v17.4s, v17.4s, v17.4s
  add v18.4s, v18.4s, v18.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  add v19.4s, v19.4s, v19.4s
  add v20.4s, v20.4s, v20.4s
  cbz x0, mixjmpvecaddtest_jellydonut
  sub x0, x0, x14
  cbnz x0, mixjmpvecaddtest_loop
mixjmpvecaddtest_jellydonut:
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixjmpvecmultest:
mixjmpvecmultest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
mixjmpvecmultest_loop:
  mul v16.4s, v16.4s, v16.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v17.4s, v17.4s, v17.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v18.4s, v18.4s, v18.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v19.4s, v19.4s, v19.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v20.4s, v20.4s, v20.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v16.4s, v16.4s, v16.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v17.4s, v17.4s, v17.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v18.4s, v18.4s, v18.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v19.4s, v19.4s, v19.4s
  cbz x0, mixjmpvecmultest_jellydonut
  mul v20.4s, v20.4s, v20.4s
  cbz x0, mixjmpvecmultest_jellydonut
  sub x0, x0, x14
  cbnz x0, mixjmpvecmultest_loop
mixjmpvecmultest_jellydonut:
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecloadtest:
vecloadtest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
vecloadtest_loop:
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
  sub x0, x0, x14
  cbnz x0, vecloadtest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_vecstoretest:
vecstoretest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 32
  ldr q0, [x1]
  ldr q1, [x1]
  ldr q2, [x1]
  ldr q3, [x1]
  ldr q4, [x1]
  ldr q5, [x1]
  ldr q6, [x1]
  ldr q7, [x1]
  ldr q8, [x1]
  ldr q9, [x1]
  ldr q10, [x1]
  ldr q11, [x1]
  ldr q12, [x1]
  ldr q13, [x1]
  ldr q14, [x1]
  ldr q15, [x1]
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1]
  ldr q22, [x1]
  ldr q23, [x1]
  ldr q24, [x1]
  ldr q25, [x1]
  ldr q26, [x1]
  ldr q27, [x1]
  ldr q28, [x1]
  ldr q29, [x1]
  ldr q30, [x1]
  ldr q31, [x1]
vecstoretest_loop:
  str q0, [x2]
  str q1, [x2]
  str q2, [x2]
  str q3, [x2]
  str q4, [x2]
  str q5, [x2]
  str q6, [x2]
  str q7, [x2]
  str q8, [x2]
  str q9, [x2]
  str q10, [x2]
  str q11, [x2]
  str q12, [x2]
  str q13, [x2]
  str q14, [x2]
  str q15, [x2]
  str q16, [x2]
  str q17, [x2]
  str q18, [x2]
  str q19, [x2]
  str q20, [x2]
  str q21, [x2]
  str q22, [x2]
  str q23, [x2]
  str q24, [x2]
  str q25, [x2]
  str q26, [x2]
  str q27, [x2]
  str q28, [x2]
  str q29, [x2]
  str q30, [x2]
  str q31, [x2]
  sub x0, x0, x14
  cbnz x0, vecstoretest_loop
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_loadtest:
loadtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
loadtest_loop:
  ldr x10, [x1]
  ldr x11, [x1]
  ldr x12, [x1]
  ldr x13, [x1]
  ldr x15, [x1]
  ldr x10, [x1]
  ldr x11, [x1]
  ldr x12, [x1]
  ldr x13, [x1]
  ldr x15, [x1]
  ldr x10, [x1]
  ldr x11, [x1]
  ldr x12, [x1]
  ldr x13, [x1]
  ldr x15, [x1]
  ldr x10, [x1]
  ldr x11, [x1]
  ldr x12, [x1]
  ldr x13, [x1]
  ldr x15, [x1]
  sub x0, x0, x14
  cbnz x0, loadtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixloadstoretest:
mixloadstoretest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
mixloadstoretest_loop:
  ldr x10, [x1]
  str x14, [x2]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  str x14, [x2]
  ldr x13, [x1]
  str x14, [x2]
  ldr x15, [x1]
  str x14, [x2]
  ldr x10, [x1]
  str x14, [x2]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  str x14, [x2]
  ldr x13, [x1]
  str x14, [x2]
  ldr x15, [x1]
  str x14, [x2]
  sub x0, x0, x14
  cbnz x0, mixloadstoretest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mix21loadstoretest:
mix21loadstoretest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 30
mix21loadstoretest_loop:
  ldr x10, [x1]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  ldr x13, [x1]
  str x14, [x2]
  ldr x10, [x1]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  ldr x13, [x1]
  str x14, [x2]
  ldr x10, [x1]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  ldr x13, [x1]
  str x14, [x2]
  ldr x10, [x1]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  ldr x13, [x1]
  str x14, [x2]
  ldr x10, [x1]
  ldr x11, [x1]
  str x14, [x2]
  ldr x12, [x1]
  ldr x13, [x1]
  str x14, [x2]
  sub x0, x0, x14
  cbnz x0, mix21loadstoretest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_jmptest:
jmptest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
jmptest_loop:
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  cbz x0, jmptest_jellydonut
  sub x0, x0, x14
  cbnz x0, jmptest_loop
jmptest_jellydonut:
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_fusejmptest:
fusejmptest:
  sub sp, sp, #0x20
  stp x14, x15, [sp, #0x10]
  mov x14, 20
fusejmptest_loop:
  nop
  nop
  cmp x0, 0
  b.eq jmptest_jellydonut
  nop
  nop
  cmp x0, 0
  b.eq jmptest_jellydonut
  nop
  nop
  cmp x0, 0
  b.eq jmptest_jellydonut
  nop
  nop
  cmp x0, 0
  b.eq jmptest_jellydonut
  nop
  sub x0, x0, x14
  cmp x0, 0
  b.ne fusejmptest_loop
fusejmptest_jellydonut:
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x20
  ret

_mixmuljmptest:
mixmuljmptest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x14, 20
mixmuljmptest_loop:
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  sub x0, x0, x14
  cbnz x0, mixmuljmptest_loop
mixmuljmptest_jellydonut:
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixmuljmptest21:
mixmuljmptest21:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x14, 30
mixmuljmptest21_loop:
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  cbz x0, mixmuljmptest21_jellydonut
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  mul x9, x9, x15
  mul x8, x8, x15
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  sub x0, x0, x14
  cbnz x0, mixmuljmptest21_loop
mixmuljmptest21_jellydonut:
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixaddjmptest:
mixaddjmptest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x14, 20
mixaddjmptest_loop:
  add x10, x10, x15
  add x11, x11, x15
  add x12, x12, x15
  add x13, x13, x15
  add x9, x9, x15
  add x8, x8, x15
  add x10, x10, x15
  add x11, x11, x15
  add x12, x12, x15
  add x13, x13, x15
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixaddjmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  cbz x0, mixmuljmptest_jellydonut
  sub x0, x0, x14
  cbnz x0, mixmuljmptest_loop
mixaddjmptest_jellydonut:
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_mixaddjmp21test:
mixaddjmp21test:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40] 
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x14, 15
mixaddjmp21test_loop:
  add x10, x10, x15
  add x11, x11, x15
  cbz x0, mixaddjmp21test_jellydonut
  
  add x12, x12, x15
  add x13, x13, x15
  cbz x0, mixaddjmp21test_jellydonut
  
  add x9, x9, x15
  add x8, x8, x15
  cbz x0, mixaddjmp21test_jellydonut
  
  add x10, x10, x15
  add x11, x11, x15
  cbz x0, mixaddjmp21test_jellydonut
  
  add x12, x12, x15
  add x13, x13, x15
  cbz x0, mixaddjmp21test_jellydonut

  sub x0, x0, x14
  cmp x0, 0
  b.gt mixaddjmp21test_loop
mixaddjmp21test_jellydonut:
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50 
  ret

_mixmulrortest:
mixmulrortest:
  sub sp, sp, #0x80
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  stp x19, x20, [sp, #0x50]
  stp x21, x22, [sp, #0x60]
  stp x23, x24, [sp, #0x70]
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x19, x8
  mov x20, x8
  mov x21, x8
  mov x22, x8
  mov x23, x8
  mov x24, x8
  mov x14, 20
mixmulrortest_loop:
  ror x24, x24, 1
  ror x23, x23, 1
  ror x22, x22, 1
  ror x21, x21, 1
  ror x20, x20, 1
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  mul x9, x9, x15
  ror x24, x24, 1
  ror x23, x23, 1
  ror x22, x22, 1
  ror x21, x21, 1
  ror x20, x20, 1
  mul x8, x8, x15
  mul x10, x10, x15
  mul x11, x11, x15
  mul x12, x12, x15
  mul x13, x13, x15
  sub x0, x0, x14
  cbnz x0, mixmulrortest_loop
  ldp x23, x24, [sp, #0x70]
  ldp x21, x22, [sp, #0x60]
  ldp x19, x20, [sp, #0x50]
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x80
  ret

_rortest:
rortest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x8, 7
  mov x9, 6
  mov x10, 1
  mov x11, 2
  mov x12, 3
  mov x13, 4
  mov x15, 5
  mov x14, 20
rortest_loop:
  ror x10, x10, 1
  ror x11, x11, 1
  ror x12, x12, 1
  ror x13, x13, 1
  ror x9, x9, 1
  ror x8, x8, 1
  ror x10, x10, 1
  ror x11, x11, 1
  ror x12, x12, 1
  ror x13, x13, 1
  ror x10, x10, 1
  ror x11, x11, 1
  ror x12, x12, 1
  ror x13, x13, 1
  ror x9, x9, 1
  ror x8, x8, 1
  ror x10, x10, 1
  ror x11, x11, 1
  ror x12, x12, 1
  ror x13, x13, 1
  sub x0, x0, x14
  cbnz x0, rortest_loop
rortest_jellydonut:
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_depmovtest:
depmovtest:
  sub sp, sp, #0x40
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
depmovtest_loop:
  mov x12, x15
  mov x10, x12
  mov x13, x10
  mov x11, x13
  mov x15, x11
  mov x12, x15
  mov x10, x12
  mov x13, x10
  mov x11, x13
  mov x15, x11
  mov x12, x15
  mov x10, x12
  mov x13, x10
  mov x11, x13
  mov x15, x11
  mov x12, x15
  mov x10, x12
  mov x13, x10
  mov x11, x13
  mov x15, x11
  sub x0, x0, x14
  cbnz x0, depmovtest_loop
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x40
  ret

_indepmovtest:
indepmovtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
indepmovtest_loop:
  mov x10, x15
  mov x11, x14
  mov x12, x13
  mov x9, x15
  mov x8, x14
  mov x10, x15
  mov x11, x14
  mov x12, x13
  mov x9, x15
  mov x8, x14
  mov x10, x15
  mov x11, x14
  mov x12, x13
  mov x9, x15
  mov x8, x14
  mov x10, x15
  mov x11, x14
  mov x12, x13
  mov x9, x15
  mov x8, x14
  sub x0, x0, x14
  cbnz x0, indepmovtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_xorzerotest:
xorzerotest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 20
xorzerotest_loop:
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  eor x15, x15, x15
  sub x0, x0, x14
  cbnz x0, xorzerotest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_movzerotest:
movzerotest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 20
movzerotest_loop:
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  mov x15, 0
  sub x0, x0, x14
  cbnz x0, movzerotest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_subzerotest:
subzerotest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x15, 1
  mov x14, 20
subzerotest_loop:
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x15, x15, x15
  sub x0, x0, x14
  cbnz x0, subzerotest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

_aesetest:
aesetest:
  sub sp, sp, #0x50
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1] 
  mov x14, 20
aesetest_loop:
  aese v0.16b, v16.16b
  aese v1.16b, v17.16b
  aese v2.16b, v18.16b
  aese v3.16b, v19.16b
  aese v4.16b, v20.16b
  aese v0.16b, v16.16b
  aese v1.16b, v17.16b
  aese v2.16b, v18.16b
  aese v3.16b, v19.16b
  aese v4.16b, v20.16b 
  aese v0.16b, v16.16b
  aese v1.16b, v17.16b
  aese v2.16b, v18.16b
  aese v3.16b, v19.16b
  aese v4.16b, v20.16b  
  aese v0.16b, v16.16b
  aese v1.16b, v17.16b
  aese v2.16b, v18.16b
  aese v3.16b, v19.16b
  aese v4.16b, v20.16b 
  sub x0, x0, x14
  cbnz x0, aesetest_loop
  add sp, sp, #0x50
  ret

_mixaesevecadd128test:
mixaesevecadd128test:
  sub sp, sp, #0x50
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1] 
  mov x14, 20
mixaesevecadd128test_loop:
  aese v0.16b, v16.16b
  add v5.4s, v9.4s, v16.4s
  aese v1.16b, v17.16b
  add v6.4s, v10.4s, v16.4s
  aese v2.16b, v18.16b
  add v7.4s, v11.4s, v16.4s
  aese v3.16b, v19.16b
  add v31.4s, v12.4s, v16.4s
  aese v4.16b, v20.16b
  add v30.4s, v13.4s, v16.4s
  aese v0.16b, v16.16b
  add v5.4s, v9.4s, v16.4s
  aese v1.16b, v17.16b
  add v6.4s, v10.4s, v16.4s
  aese v2.16b, v18.16b
  add v7.4s, v11.4s, v16.4s
  aese v3.16b, v19.16b
  add v31.4s, v12.4s, v16.4s
  aese v4.16b, v20.16b
  add v30.4s, v13.4s, v16.4s 
  sub x0, x0, x14
  cbnz x0, mixaesevecadd128test_loop
  add sp, sp, #0x50
  ret 

_pmulltest:
pmulltest:
  sub sp, sp, #0x50
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1] 
  mov x14, 20
pmulltest_loop:
  pmull v0.1q, v16.1d, v17.1d
  pmull v1.1q, v16.1d, v17.1d
  pmull v2.1q, v16.1d, v17.1d
  pmull v3.1q, v16.1d, v17.1d
  pmull v4.1q, v16.1d, v17.1d
  pmull v0.1q, v16.1d, v17.1d
  pmull v1.1q, v16.1d, v17.1d
  pmull v2.1q, v16.1d, v17.1d
  pmull v3.1q, v16.1d, v17.1d
  pmull v4.1q, v16.1d, v17.1d 
  pmull v0.1q, v16.1d, v17.1d
  pmull v1.1q, v16.1d, v17.1d
  pmull v2.1q, v16.1d, v17.1d
  pmull v3.1q, v16.1d, v17.1d
  pmull v4.1q, v16.1d, v17.1d 
  pmull v0.1q, v16.1d, v17.1d
  pmull v1.1q, v16.1d, v17.1d
  pmull v2.1q, v16.1d, v17.1d
  pmull v3.1q, v16.1d, v17.1d
  pmull v4.1q, v16.1d, v17.1d 
  sub x0, x0, x14
  cbnz x0, pmulltest_loop
  add sp, sp, #0x50
  ret 

_mixpmulladd128test:
mixpmulladd128test:
  sub sp, sp, #0x50
  ldr q16, [x1]
  ldr q17, [x1]
  ldr q18, [x1]
  ldr q19, [x1]
  ldr q20, [x1]
  ldr q21, [x1] 
  mov x14, 20
mixpmulladd128test_loop:
  pmull v0.1q, v16.1d, v17.1d
  add v5.4s, v9.4s, v16.4s
  pmull v1.1q, v16.1d, v17.1d
  add v6.4s, v9.4s, v16.4s
  pmull v2.1q, v16.1d, v17.1d
  add v7.4s, v9.4s, v16.4s
  pmull v3.1q, v16.1d, v17.1d
  add v31.4s, v9.4s, v16.4s
  pmull v4.1q, v16.1d, v17.1d
  add v30.4s, v9.4s, v16.4s
  pmull v0.1q, v16.1d, v17.1d
  add v5.4s, v9.4s, v16.4s
  pmull v1.1q, v16.1d, v17.1d
  add v6.4s, v9.4s, v16.4s
  pmull v2.1q, v16.1d, v17.1d
  add v7.4s, v9.4s, v16.4s
  pmull v3.1q, v16.1d, v17.1d
  add v31.4s, v9.4s, v16.4s
  pmull v4.1q, v16.1d, v17.1d
  add v30.4s, v9.4s, v16.4s 
  sub x0, x0, x14
  cbnz x0, mixpmulladd128test_loop
  add sp, sp, #0x50
  ret 
