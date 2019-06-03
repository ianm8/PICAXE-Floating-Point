#rem

   Copyright (c) Ian Mitchell 2015
 
   This program is free software: you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public License
   as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version.
 
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU Lesser General Public License for more details.
 
   You should have received a copy of the GNU Lesser General
   Public License along with this program. If not, see
   <http://www.gnu.org/licenses/>.

#endrem

#picaxe 08m2
;#picaxe 14m2
;#picaxe 18m2
;#picaxe 20m2
#simspeed 0

;#define FLOAT32_DISABLE_ADD
;#define FLOAT32_DISABLE_SUB
;#define FLOAT32_DISABLE_MUL
;#define FLOAT32_DISABLE_DIV
#define FLOAT32_DISABLE_MOD
;#define FLOAT32_DISABLE_ABS
;#define FLOAT32_DISABLE_NEG
;#define FLOAT32_DISABLE_CMP
#define FLOAT32_DISABLE_SQRT
#define FLOAT32_DISABLE_FRAC
;#define FLOAT32_DISABLE_SWAP
;#define FLOAT32_DISABLE_MOVE
;#define FLOAT32_DISABLE_CLEAR
;#define FLOAT32_DISABLE_INT2FLOAT
;#define FLOAT32_DISABLE_FLOAT2INT
#define FLOAT32_DISABLE_FTOA
#define FLOAT32_DISABLE_ATOF

;fix dependancies
#ifndef FLOAT32_DISABLE_SUB
#undefine FLOAT32_DISABLE_ADD
#endif
#ifndef FLOAT32_DISABLE_MOD
#undefine FLOAT32_DISABLE_MUL
#undefine FLOAT32_DISABLE_DIV
#undefine FLOAT32_DISABLE_SUB
#undefine FLOAT32_DISABLE_ADD
#undefine FLOAT32_DISABLE_MOVE
#undefine FLOAT32_DISABLE_INT2FLOAT
#undefine FLOAT32_DISABLE_FLOAT2INT
#endif

; constants
symbol float32_one_1 = 0x3f80
symbol float32_one_0 = 0x0000
symbol float32_PI_1 = 0x4049
symbol float32_PI_0 = 0x0fdb
symbol float32_2PI_1 = 0x40c9
symbol float32_2PI_0 = 0x0fdb
symbol float32_PI2_1 = 0x3fc9
symbol float32_PI2_0 = 0x0fdb

symbol float32_a0 = w13
symbol float32_a1 = w12
symbol float32_ax = b19
symbol float32_b0 = w11
symbol float32_b1 = w10
symbol float32_bx = b18

symbol float32_t0 = w8
symbol float32_t1 = w7
symbol float32_t2 = w6
symbol float32_t3 = w5
symbol float32_t4 = w4
symbol float32_t5 = w3
symbol float32_t6 = w2
symbol float32_t7 = w1
symbol float32_tw = w1
 
symbol float32_c0 = bit0
symbol float32_c1 = bit1
symbol float32_c2 = bit2
symbol float32_as = bit3
symbol float32_bs = bit4
symbol float32_tb = b1

symbol float32_a0_1 = b27
symbol float32_a0_0 = b26
symbol float32_a1_1 = b25
symbol float32_a1_0 = b24
symbol float32_b0_1 = b23
symbol float32_b0_0 = b22
symbol float32_b1_1 = b21
symbol float32_b1_0 = b20
symbol float32_t0_1 = b17
symbol float32_t0_0 = b16
symbol float32_t1_1 = b15
symbol float32_t1_0 = b14
symbol float32_t2_1 = b13
symbol float32_t2_0 = b12
symbol float32_t3_1 = b11
symbol float32_t3_0 = b10
symbol float32_t4_1 = b9
symbol float32_t4_0 = b8
symbol float32_t5_1 = b7
symbol float32_t5_0 = b6

symbol float32_ca = w1
symbol float32_a = b2
symbol float32_c = b3

symbol float32_p10_1 = w2
symbol float32_p10_0 = w1

symbol float32_10_1 = 0x4120
symbol float32_10_0 = 0x0000
symbol float32_1_1 = 0x3F80
symbol float32_1_0 = 0x0000
symbol float32_0_1_1 = 0x3DCC
symbol float32_0_1_0 = 0xCCCD
symbol float32_0_301_1 = 0x3E9A
symbol float32_0_301_0 = 0x1CAC

;temporary storage for composite functions
symbol float32_t10 = w12
symbol float32_t11 = w11
symbol float32_t20 = w10
symbol float32_t21 = w9
symbol float32_t30 = w8
symbol float32_t31 = w7
symbol float32_t40 = w6
symbol float32_t41 = w5
symbol float32_t50 = w4
symbol float32_t51 = w3
symbol float32_tdd = w2


#rem
start:
bptr = 0x1c
@bptrinc = "-"
@bptrinc = "3"
@bptrinc = "."
@bptrinc = "1"
@bptrinc = "4"
@bptrinc = "1"
@bptrinc = "5"
@bptrinc = "9"
@bptrinc = "3"
;@bptrinc = "6"
;@bptrinc = "5"
;@bptrinc = "4"
;@bptrinc = "3"
@bptrinc = 0
bptr = 0x1c
gosub float32_atof
;float32_a1 = float32_0_301_1
;float32_a0 = float32_0_301_0
;float32_a1 = 0x38D1
;float32_a0 = 0xB717

;1000.2
;float32_a1 = 0x447A
;float32_a0 = 0x0CCD
;bptr = 0x1c
;gosub float32_ftoa
end
#endrem

      ;SEROUT 2,T9600_32,(#w0,flPUSH)
      ;float32_a0 = float32_PI_0
      ;float32_a1 = float32_PI_1
      ;gosub float32_sqrt
      ;end

#ifndef FLOAT32_DISABLE_CLEAR
float32_clear_a:
      float32_a0 = 0
      float32_a1 = 0
      return

float32_clear_b:
      float32_b0 = 0
      float32_b1 = 0
      return
#endif

#ifndef FLOAT32_DISABLE_SWAP
float32_swap:
      ;more efficient than swap!
      float32_a0 = float32_a0^float32_b0
      float32_a1 = float32_a1^float32_b1
      float32_b0 = float32_b0^float32_a0
      float32_b1 = float32_b1^float32_a1
      float32_a0 = float32_a0^float32_b0
      float32_a1 = float32_a1^float32_b1
      return
#endif

#ifndef FLOAT32_DISABLE_MOVE
float32_mova2b:
      float32_b0 = float32_a0
      float32_b1 = float32_a1
      return

float32_movb2a:
      float32_a0 = float32_b0
      float32_a1 = float32_b1
      return
#endif
     
float32_nega:
      float32_c = 1
      float32_a0 = not float32_a0
      float32_a1 = not float32_a1
      float32_ca = float32_a0_0+float32_c : float32_a0_0 = float32_a
      float32_ca = float32_a0_1+float32_c : float32_a0_1 = float32_a
      float32_ca = float32_a1_0+float32_c : float32_a1_0 = float32_a
      float32_ca = float32_a1_1+float32_c : float32_a1_1 = float32_a
      return

#ifndef FLOAT32_DISABLE_ADD
float32_add:
      gosub float32_unpack
 
      if float32_ax<float32_bx then
         float32_tb = float32_bx-float32_ax max 30
         do
            float32_a0 = float32_a0/2
            float32_a0 = float32_a1*0x8000|float32_a0
            float32_a1 = float32_a1/2
            dec float32_tb
         loop until float32_tb=0
         float32_ax = float32_bx
      elseif float32_ax>float32_bx then
         float32_tb = float32_ax-float32_bx max 30
         do
            float32_b0 = float32_b0/2
            float32_b0 = float32_b1*0x8000|float32_b0
            float32_b1 = float32_b1/2
            dec float32_tb
         loop until float32_tb=0
         float32_bx = float32_ax
      endif

      ;negate a?
      if float32_as=1 then
         gosub float32_nega
      endif

      ;negate b?
      if float32_bs=1 then
         float32_c = 1
         float32_b0 = not float32_b0
         float32_b1 = not float32_b1
         float32_ca = float32_b0_0+float32_c : float32_b0_0 = float32_a
         float32_ca = float32_b0_1+float32_c : float32_b0_1 = float32_a
         float32_ca = float32_b1_0+float32_c : float32_b1_0 = float32_a
         float32_ca = float32_b1_1+float32_c : float32_b1_1 = float32_a
      endif

      ;a=a+b
      float32_ca = 0
      float32_ca = float32_a0_0+float32_b0_0+float32_c : float32_a0_0 = float32_a
      float32_ca = float32_a0_1+float32_b0_1+float32_c : float32_a0_1 = float32_a
      float32_ca = float32_a1_0+float32_b1_0+float32_c : float32_a1_0 = float32_a
      float32_ca = float32_a1_1+float32_b1_1+float32_c : float32_a1_1 = float32_a

      ;negate a?
      float32_as = float32_a1/0x8000
      if float32_as=1 then
         gosub float32_nega
      endif

      gosub float32_normalize
      return
#endif

#ifndef FLOAT32_DISABLE_SUB
float32_sub:
      float32_b1 = float32_b1^0x8000
      gosub float32_add
      return
#endif

#ifndef FLOAT32_DISABLE_MUL
float32_mul:
      gosub float32_unpack

      float32_as = float32_as^float32_bs
      float32_ax = float32_ax-127+float32_bx

      float32_t0 = 0
      float32_t1 = 0
      float32_tb = 32

      ; shift right b into carry
      float32_c0 = float32_b0&0x0001
      float32_b0 = float32_b0/2
      float32_b0 = float32_b1*0x8000|float32_b0
      float32_b1 = float32_b1/2

      do
         float32_ca = 0
         if float32_c0=1 then
            float32_ca = float32_t0_0+float32_a0_0+float32_c : float32_t0_0 = float32_a
            float32_ca = float32_t0_1+float32_a0_1+float32_c : float32_t0_1 = float32_a
            float32_ca = float32_t1_0+float32_a1_0+float32_c : float32_t1_0 = float32_a
            float32_ca = float32_t1_1+float32_a1_1+float32_c : float32_t1_1 = float32_a
         endif
 
         ; rotate right t into carry
         float32_c1 = float32_c
         float32_c0 = float32_t0&1
         float32_t0 = float32_t0/2
         float32_t0 = float32_t1*0x8000|float32_t0
         float32_t1 = float32_t1/2
         float32_t1 = float32_c1*0x8000|float32_t1
 
         ; rotate right b into carry
         float32_c1 = float32_c0
         float32_c0 = float32_b0&1
         float32_b0 = float32_b0/2
         float32_b0 = float32_b1*0x8000|float32_b0
         float32_b1 = float32_b1/2
         float32_b1 = float32_c1*0x8000|float32_b1
 
         dec float32_tb
      loop until float32_tb=0

      ;justify result (shift left 3)
      float32_t1 = float32_t1*8
      float32_t1 = float32_t0/0x2000|float32_t1
      float32_t0 = float32_t0*8
      float32_a0 = float32_t0
      float32_a1 = float32_t1
      gosub float32_normalize
      return
#endif

#ifndef FLOAT32_DISABLE_DIV
float32_div:
      gosub float32_unpack
 
      float32_as = float32_as^float32_bs
      float32_ax = float32_ax-float32_bx+127
 
      float32_t0 = 0
      float32_t1 = 0
      float32_tb = 30
 
      ; prepare b for ones subtract
      float32_b0 = not float32_b0
      float32_b1 = not float32_b1

      do
         ;shift left t
         float32_t1 = float32_t1*2
         float32_t1 = float32_t0/0x8000|float32_t1
         float32_t0 = float32_t0*2
 
         ;float32_a>=float32_b?
         float32_c = 1
         float32_ca = float32_a0_0+float32_b0_0+float32_c : float32_t2_0 = float32_a
         float32_ca = float32_a0_1+float32_b0_1+float32_c : float32_t2_1 = float32_a
         float32_ca = float32_a1_0+float32_b1_0+float32_c : float32_t3_0 = float32_a
         float32_ca = float32_a1_1+float32_b1_1+float32_c : float32_t3_1 = float32_a
         if float32_c=1 then
            ; a-b
            float32_a0 = float32_t2
            float32_a1 = float32_t3
 
            ;inc t (float32_c = 1)
            float32_ca = float32_t0_0+float32_c : float32_t0_0 = float32_a
            float32_ca = float32_t0_1+float32_c : float32_t0_1 = float32_a
            float32_ca = float32_t1_0+float32_c : float32_t1_0 = float32_a
            float32_ca = float32_t1_1+float32_c : float32_t1_1 = float32_a
         endif
 
         ;shift left a
         float32_a1 = float32_a1*2
         float32_a1 = float32_a0/0x8000|float32_a1
         float32_a0 = float32_a0*2
 
         ;loop
         dec float32_tb
      loop until float32_tb=0
 
      float32_a0 = float32_t0
      float32_a1 = float32_t1
      gosub float32_normalize
      return
#endif

#ifndef FLOAT32_DISABLE_SQRT
float32_sqrt:
      ;negative?
      if float32_a1>=0x8000 then
         gosub float32_clear_a
         return
      endif
      gosub float32_unpack

      ;if exponent is odd shift mantissa left
      float32_c0 = float32_ax&0x01
      if float32_c0=1 then
         float32_a1 = float32_a1*2
         float32_a1 = float32_a0/0x8000|float32_a1
         float32_a0 = float32_a0*2
      endif
      float32_ax = float32_ax/2+float32_c0+63

      float32_t1 = 0
      float32_t0 = 0
      float32_t3 = 0
      float32_t2 = 0
      float32_tb = 30

      do
         ;get 2 bits of arg
         float32_t3 = float32_t3*4
         float32_t3 = float32_t2/0x4000|float32_t3
         float32_t2 = float32_t2*4
         float32_t2 = float32_a1/0x4000|float32_t2
         float32_a1 = float32_a1*4
         float32_a1 = float32_a0/0x4000|float32_a1
         float32_a0 = float32_a0*4

         ;get ready for the next bit in the root
         float32_t1 = float32_t1*2
         float32_t1 = float32_t0/0x8000|float32_t1
         float32_t0 = float32_t0*2

         ;test radical
         float32_t5 = float32_t1*2
         float32_t5 = float32_t0/0x8000|float32_t5
         float32_t4 = float32_t0*2

         float32_c = 1
         float32_ca = float32_t4_0+float32_c : float32_t4_0 = float32_a
         float32_ca = float32_t4_1+float32_c : float32_t4_1 = float32_a
         float32_ca = float32_t5_0+float32_c : float32_t5_0 = float32_a
         float32_ca = float32_t5_1+float32_c : float32_t5_1 = float32_a
         
         float32_c = 1
         float32_t4 = not float32_t4
         float32_t5 = not float32_t5
         float32_ca = float32_t2_0+float32_t4_0+float32_c : float32_b0_0 = float32_a
         float32_ca = float32_t2_1+float32_t4_1+float32_c : float32_b0_1 = float32_a
         float32_ca = float32_t3_0+float32_t5_0+float32_c : float32_b1_0 = float32_a
         float32_ca = float32_t3_1+float32_t5_1+float32_c : float32_b1_1 = float32_a

         if float32_c=1 then
            float32_t2 = float32_b0
            float32_t3 = float32_b1
            float32_ca = float32_t0_0+float32_c : float32_t0_0 = float32_a
            float32_ca = float32_t0_1+float32_c : float32_t0_1 = float32_a
            float32_ca = float32_t1_0+float32_c : float32_t1_0 = float32_a
            float32_ca = float32_t1_1+float32_c : float32_t1_1 = float32_a
         endif

         dec float32_tb
      loop while float32_tb>0

      ;align the msb
      float32_a1 = float32_t1
      float32_a0 = float32_t0
      if float32_a0!=0 or float32_a1!=0 then
         do while float32_a1<0x2000
            float32_a1 = float32_a1*2
            float32_a1 = float32_a0/0x8000|float32_a1
            float32_a0 = float32_a0*2
         loop
      endif
      gosub float32_pack
      return
#endif

#ifndef FLOAT32_DISABLE_CMP
float32_cmp:
      ;return value in byte pointed to by bptr
      ;return 0xff if a<b
      ;return 0x00 if a=b
      ;return 0x01 if a>b
      gosub float32_unpack
      @bptr = 0x1
      if float32_ax=float32_bx and float32_a1=0 and float32_a0=0 and float32_b1=0 and float32_b0=0 then
         @bptr = 0
      elseif float32_as!=float32_bs then
         if float32_as=1 then
            @bptr = 0xff
         endif
      elseif float32_ax=float32_bx and float32_a1=float32_b1 and float32_a0=float32_b0 then
         @bptr = 0
      else
         if float32_ax<float32_bx then
            @bptr = 0xff
         elseif float32_ax=float32_bx then
            if float32_a1<float32_b1 then
               @bptr = 0xff
            elseif float32_a1=float32_b1 then
               if float32_a0<float32_b0 then
                  @bptr = 0xff
               endif
            endif
         endif
      endif
      gosub float32_pack
      return
#endif

#ifndef FLOAT32_DISABLE_INT2FLOAT
float32_int2float:
      gosub float32_save
      float32_as = float32_a1/0x8000
      if float32_as=1 then
         gosub float32_nega
      endif
      float32_ax = 156; preset to 127+31 then adjust with normalize
      gosub float32_normalize
      return
#endif

#ifndef FLOAT32_DISABLE_FLOAT2INT
float32_float2int:
      gosub float32_unpack
      ;exponent in range 0-30?
      if float32_ax<127 or float32_ax>157 then
         gosub float32_clear_a
         gosub float32_restore
         return
      endif

      ;msb justify (shift left 1)
      float32_a1 = float32_a1*2
      float32_a1 = float32_a0/0x8000|float32_a1
      float32_a0 = float32_a0*2

      ;shift down
      float32_tb = 157-float32_ax
      do while float32_tb>0
         float32_a0 = float32_a0/2
         float32_a0 = float32_a1*0x8000|float32_a0
         float32_a1 = float32_a1/2
         dec float32_tb
      loop
       
      ;negate if float was negative
      if float32_as=1 then
         gosub float32_nega
      endif
      gosub float32_restore
      return
#endif

#ifndef FLOAT32_DISABLE_FRAC
float32_frac:
      gosub float32_unpack
      if float32_ax<127 then
         gosub float32_pack
         return
      endif
      float32_tb = float32_ax-127 max 30
      do while float32_tb>0
         float32_a1 = float32_a1*2
         float32_a1 = float32_a0/0x8000|float32_a1
         float32_a0 = float32_a0*2
         dec float32_tb
      loop
      float32_a1 = float32_a1&0x1fff
      float32_ax = 127
      gosub float32_normalize
      return
#endif

#ifndef FLOAT32_DISABLE_MOD
float32_mod:
      ;a = mod(a,b)
      poke 0x68,word float32_a0
      poke 0x6a,word float32_a1
      gosub float32_div
      gosub float32_float2int
      gosub float32_int2float
      gosub float32_mul
      gosub float32_mova2b
      peek 0x68,word float32_a0
      peek 0x6a,word float32_a1
      gosub float32_sub
      return
#endif

#ifndef FLOAT32_DISABLE_ABS
float32_abs:
      float32_a1 = float32_a1&0x7fff
      return
#endif

#ifndef FLOAT32_DISABLE_NEG
float32_neg_a:
      float32_a1 = float32_a1^0x8000
      return

float32_neg_b:
      float32_b1 = float32_b1^0x8000
      return
#endif
      
float32_normalize:
      if float32_a0=0 and float32_a1=0 then
         float32_ax = 0
         float32_as = 0
         gosub float32_pack
         return
      endif
      if float32_a1>=0x4000 then
         float32_a0 = float32_a0/2
         float32_a0 = float32_a1*0x8000|float32_a0
         float32_a1 = float32_a1/2
         inc float32_ax
      else
         do while float32_a1<0x2000
            float32_a1 = float32_a1*2
            float32_a1 = float32_a0/0x8000|float32_a1
            float32_a0 = float32_a0*2
            dec float32_ax
         loop
      endif

      ;rounding
      float32_ca = float32_a0_0+0x20 : float32_a0_0 = float32_a
      float32_ca = float32_a0_1+float32_c : float32_a0_1 = float32_a
      float32_ca = float32_a1_0+float32_c : float32_a1_0 = float32_a
      float32_ca = float32_a1_1+float32_c : float32_a1_1 = float32_a
      
      if float32_a1>=0x4000 then
         float32_a0 = float32_a0/2
         float32_a0 = float32_a1*0x8000|float32_a0
         float32_a1 = float32_a1/2
         inc float32_ax
      endif
      gosub float32_pack
      return

float32_pack:
      float32_a0 = float32_a0/0x0040
      float32_a0 = float32_a1*0x0400|float32_a0
      float32_a1 = float32_a1/0x0040&0x007f
      float32_a1 = float32_ax*0x0080|float32_a1
      float32_a1 = float32_as*0x8000|float32_a1
      gosub float32_restore
      return

float32_unpack:
      ;save registers
      gosub float32_save
      ;unpack
      float32_ax = float32_a1/0x0080&0x00ff
      if float32_ax=0 then
         float32_as = 0
         float32_a1 = 0
         float32_a0 = 0
      else
         float32_as = float32_a1/0x8000
         float32_a1 = float32_a1*0x0040&0x1fff|0x2000
         float32_a1 = float32_a0/0x0400|float32_a1
         float32_a0 = float32_a0*0x0040
      endif
      float32_bx = float32_b1/0x0080&0x00ff
      if float32_bx=0 then
         float32_bs = 0
         float32_b1 = 0
         float32_b0 = 0
      else
         float32_bs = float32_b1/0x8000
         float32_b1 = float32_b1*0x0040&0x1fff|0x2000
         float32_b1 = float32_b0/0x0400|float32_b1
         float32_b0 = float32_b0*0x0040
      endif
      return

#ifndef float32_DISABLE_ATOF
float32_atof:
      gosub float32_saveram
      w5 = 0;
      gosub float32_clear_a
      do
         b0 = @bptrinc
         select b0
            case 0
               exit
            case "-"
               w5 = 0x8000;
            case "0" to "9"
               float32_b1 = float32_10_1
               float32_b0 = float32_10_0
               gosub float32_mul
               gosub float32_mova2b
               float32_a1 = 0
               float32_a0 = b0-"0"
               gosub float32_int2float
               gosub float32_add
            case "."  
               float32_p10_1 = float32_0_1_1
               float32_p10_0 = float32_0_1_0
               poke 0x78,word float32_a0
               poke 0x7a,word float32_a1
               do
                  b0 = @bptrinc
                  select b0
                     case 0
                        exit
                     case "0" to "9"
                        float32_a1 = 0
                        float32_a0 = b0-"0"
                        float32_b1 = float32_p10_1
                        float32_b0 = float32_p10_0
                        gosub float32_int2float
                        gosub float32_mul
                        gosub float32_mova2b:
                        peek 0x78,word float32_a0
                        peek 0x7a,word float32_a1
                        gosub float32_add
                        poke 0x78,word float32_a0
                        poke 0x7a,word float32_a1
                        float32_a1 = float32_p10_1
                        float32_a0 = float32_p10_0
                        float32_b1 = float32_0_1_1
                        float32_b0 = float32_0_1_0
                        gosub float32_mul
                        float32_p10_1 = float32_a1
                        float32_p10_0 = float32_a0
                  endselect 
               loop
               peek 0x78,word float32_a0
               peek 0x7a,word float32_a1
               exit
         endselect
      loop
      float32_a1 = float32_a1|w5
      gosub float32_restoreram
      return
#endif

#ifndef FLOAT32_DISABLE_FTOA
float32_pow10:
      ; w0 has signed integer exponent
      ; returns 10 to the power of -w0
      ;gosub float32_saveram_2
      poke 0x4c,word w0
      poke 0x4e,word w1
      float32_a1 = float32_1_1
      float32_a0 = float32_1_0
      float32_p10_1 = float32_10_1
      float32_p10_0 = float32_10_0
      w0 = -w0
      if w0>0x7fff then
         float32_p10_1 = float32_0_1_1
         float32_p10_0 = float32_0_1_0
         w0 = -w0
      endif
      do while w0>0
         float32_b1 = float32_p10_1
         float32_b0 = float32_p10_0
         if bit0=1 then
            gosub float32_mul
         endif
         poke 0x7c,word float32_a0
         poke 0x7e,word float32_a1
         float32_a1 = float32_p10_1
         float32_a0 = float32_p10_0
         gosub float32_mul
         float32_p10_1 = float32_a1
         float32_p10_0 = float32_a0
         peek 0x7c,word float32_a0
         peek 0x7e,word float32_a1
         w0 = w0/2
      loop
      ;gosub float32_restoreram_2
      peek 0x4c,word w0
      peek 0x4e,word w1
      return
      
float32_ftoa:
      gosub float32_saveram
      w1 = bptr
      if float32_a1=0 or float32_a1=0x8000 and float32_a0=0 then
         @bptrinc = "0"
         @bptrinc = 0
         bptr = w1
         gosub float32_restoreram
         return
      endif
      if float32_a1>0x7fff then
         float32_a1 = float32_a1&0x7fff
         @bptrinc = "-"
      endif
      poke 0x78,word float32_a0
      poke 0x7a,word float32_a1
      w0 = float32_a1/0x80&0xff-127
      ;log10(2)
      if w0>0x7fff then
         w0 = -w0*77/256
         w0 = -w0
      else
         w0 = w0*77/256
      endif
      gosub float32_pow10
      gosub float32_mova2b
      peek 0x78,word float32_a0
      peek 0x7a,word float32_a1
      gosub float32_mul
 
      ;get within 1 and 10
      float32_b1 = float32_10_1
      float32_b0 = float32_10_0
      do while float32_a1<0x3f80
         gosub float32_mul
         dec w0
      loop
      float32_b1 = float32_0_1_1
      float32_b0 = float32_0_1_0
      do while float32_a1>=0x4120
         gosub float32_mul
         inc w0
      loop
 
      for b4=0 to 6
         poke 0x78,word float32_a0
         poke 0x7a,word float32_a1
         gosub float32_float2int
         @bptrinc = float32_a0+"0"
         if b4=0 then
            @bptrinc = "."
         endif
         peek 0x78,word float32_a0
         peek 0x7a,word float32_a1
         gosub float32_frac
         float32_b1 = float32_10_1
         float32_b0 = float32_10_0
         gosub float32_mul
      next
      dec bptr
      for b4=0 to 4
         if @bptr="0" then
            dec bptr
         else
            exit
         endif
      next
      inc bptr
      if b0!=0 then
         @bptrinc = "e"
         if b0>0x7f then
            @bptrinc = "-"
            b0 = -b0
         endif
         bintoascii b0,b5,b6,b7
         b4 = 0
         if b5!="0" then : @bptrinc = b5 : b4 = 1 endif
         if b6!="0" or b4=1 then : @bptrinc = b6 : b4 = 1 : endif
         @bptrinc = b7
      endif
      @bptr = 0
      bptr = w1
      gosub float32_restoreram
      return
#endif

float32_saveram:
      poke 0x68,word w0
      poke 0x6a,word w1
      poke 0x6c,word w2
      poke 0x6e,word w3
      poke 0x70,word w4
      poke 0x72,word w5
      poke 0x74,word w6
      poke 0x76,word w7
      return

float32_restoreram:
      peek 0x68,word w0
      peek 0x6a,word w1
      peek 0x6c,word w2
      peek 0x6e,word w3
      peek 0x70,word w4
      peek 0x72,word w5
      peek 0x74,word w6
      peek 0x76,word w7
      return

float32_save:
      poke 0x50,word w0
      poke 0x52,word w1
      poke 0x54,word w2
      poke 0x56,word w3
      poke 0x58,word w4
      poke 0x5a,word w5
      poke 0x5c,word w6
      poke 0x5e,word w7
      poke 0x60,word w8
      poke 0x62,word w9
      poke 0x64,word w10
      poke 0x66,word w11
      return

float32_restore:
      peek 0x50,word w0
      peek 0x52,word w1
      peek 0x54,word w2
      peek 0x56,word w3
      peek 0x58,word w4
      peek 0x5a,word w5
      peek 0x5c,word w6
      peek 0x5e,word w7
      peek 0x60,word w8
      peek 0x62,word w9
      peek 0x64,word w10
      peek 0x66,word w11
      return
