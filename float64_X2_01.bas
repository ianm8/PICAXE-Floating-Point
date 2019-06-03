#rem

   Copyright (c) Ian Mitchell 2015
 
   This program is free software: you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public License
   as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version.
 
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.
 
   You should have received a copy of the GNU Lesser General
   Public License along with this program. If not, see
   <http://www.gnu.org/licenses/>.

#endrem

;#picaxe 20x2
#picaxe 28x2
;#picaxe 40x2
#simspeed 0
 
 
;#define FLOAT64_DISABLE_ADD
;#define FLOAT64_DISABLE_SUB
;#define FLOAT64_DISABLE_MUL
;#define FLOAT64_DISABLE_DIV
;#define FLOAT64_DISABLE_CMP
;#define FLOAT64_DISABLE_MOD
;#define FLOAT64_DISABLE_ABS
;#define FLOAT64_DISABLE_SQRT
;#define FLOAT64_DISABLE_FRAC
;#define FLOAT64_DISABLE_SWAP
;#define FLOAT64_DISABLE_MOVE
;#define FLOAT64_DISABLE_CLEAR
;#define FLOAT64_DISABLE_INT2FLOAT
;#define FLOAT64_DISABLE_FLOAT2INT
;#define FLOAT64_DISABLE_FTOA
;#define FLOAT64_DISABLE_ATOF

;fix dependancies
#ifndef FLOAT64_DISABLE_SUB
#define FLOAT64_DISABLE_ADD
#undefine FLOAT64_DISABLE_ADD
#endif
#ifndef FLOAT64_DISABLE_MOD
#define FLOAT64_DISABLE_MUL
#define FLOAT64_DISABLE_DIV
#define FLOAT64_DISABLE_SUB
#define FLOAT64_DISABLE_ADD
#define FLOAT64_DISABLE_MOVE
#define FLOAT64_DISABLE_INT2FLOAT
#define FLOAT64_DISABLE_FLOAT2INT
#undefine FLOAT64_DISABLE_MUL
#undefine FLOAT64_DISABLE_DIV
#undefine FLOAT64_DISABLE_SUB
#undefine FLOAT64_DISABLE_ADD
#undefine FLOAT64_DISABLE_MOVE
#undefine FLOAT64_DISABLE_INT2FLOAT
#undefine FLOAT64_DISABLE_FLOAT2INT
#endif
 
symbol float64_a0 = w27
symbol float64_a1 = w26
symbol float64_a2 = w25
symbol float64_a3 = w24
symbol float64_ax = w23
symbol float64_b0 = w22
symbol float64_b1 = w21
symbol float64_b2 = w20
symbol float64_b3 = w19
symbol float64_bx = w18
 
symbol float64_t0 = w17
symbol float64_t1 = w16
symbol float64_t2 = w15
symbol float64_t3 = w14
symbol float64_t4 = w13
symbol float64_t5 = w12
symbol float64_t6 = w11
symbol float64_t7 = w10
symbol float64_u0 = w9
symbol float64_u1 = w8
symbol float64_u2 = w7
symbol float64_u3 = w6
symbol float64_u4 = w5
symbol float64_u5 = w4
symbol float64_u6 = w3

symbol float64_a0_1 = b55
symbol float64_a0_0 = b54
symbol float64_a1_1 = b53
symbol float64_a1_0 = b52
symbol float64_a2_1 = b51
symbol float64_a2_0 = b50
symbol float64_a3_1 = b49
symbol float64_a3_0 = b48
symbol float64_b0_1 = b45
symbol float64_b0_0 = b44
symbol float64_b1_1 = b43
symbol float64_b1_0 = b42
symbol float64_b2_1 = b41
symbol float64_b2_0 = b40
symbol float64_b3_1 = b39
symbol float64_b3_0 = b38
symbol float64_t0_1 = b35
symbol float64_t0_0 = b34
symbol float64_t1_1 = b33
symbol float64_t1_0 = b32
symbol float64_t2_1 = b31
symbol float64_t2_0 = b30
symbol float64_t3_1 = b29
symbol float64_t3_0 = b28
symbol float64_t4_1 = b27
symbol float64_t4_0 = b26
symbol float64_t5_1 = b25
symbol float64_t5_0 = b24
symbol float64_t6_1 = b23
symbol float64_t6_0 = b22
symbol float64_t7_1 = b21
symbol float64_t7_0 = b20
symbol float64_u0_1 = b19
symbol float64_u0_0 = b18
symbol float64_u1_1 = b17
symbol float64_u1_0 = b16
symbol float64_u2_1 = b15
symbol float64_u2_0 = b14
symbol float64_u3_1 = b13
symbol float64_u3_0 = b12
 
symbol float64_ca = w1
symbol float64_a = b2
symbol float64_c = b3

symbol float64_tb = b1
symbol float64_c0 = bit0
symbol float64_c1 = bit1
;symbol float64_c2 = bit2
;symbol float64_c3 = bit3
;symbol float64_c4 = bit4
;symbol float64_c5 = bit5
symbol float64_as = bit6
symbol float64_bs = bit7
 
symbol float64_p10_3 = w4
symbol float64_p10_2 = w3
symbol float64_p10_1 = w2
symbol float64_p10_0 = w1

symbol float64_10_3 = 0x4024
symbol float64_10_2 = 0
symbol float64_10_1 = 0
symbol float64_10_0 = 0
symbol float64_1_3 = 0x3FF0
symbol float64_1_2 = 0
symbol float64_1_1 = 0
symbol float64_1_0 = 0
symbol float64_0_1_3 = 0x3FB9
symbol float64_0_1_2 = 0x9999
symbol float64_0_1_1 = 0x9999
symbol float64_0_1_0 = 0x999A
symbol float64_0_301_3 = 0x3FD3
symbol float64_0_301_2 = 0x4395
symbol float64_0_301_1 = 0x8106
symbol float64_0_301_0 = 0x24DD
 
;;;incorporate x into 3!!
symbol const_31980000_3 = 0x3cff
symbol const_31980000_2 = 0x3c00
symbol const_31980000_1 = 0x0000
symbol const_31980000_0 = 0x0000
;symbol const_31980000_x = 151
symbol const_2_29_3 = 0x2000
symbol const_2_29_2 = 0x0000
symbol const_2_29_1 = 0x0000
symbol const_2_29_0 = 0x0000
;symbol const_2_29_x = 127+29
symbol M_3 = w5
symbol M_2 = w4
symbol M_1 = w3
symbol M_0 = w2
symbol m = b1
 
   ;ptr = 16
   ;1234.567
   ;float64_a3 = 0x4093
   ;float64_a2 = 0x4A44
   ;float64_a1 = 0x9BA5
   ;float64_a0 = 0xE354
   ;0.00012345678
   ;float64_a3 = 0x3F20
   ;float64_a2 = 0x2E85
   ;float64_a1 = 0xAA46
   ;float64_a0 = 0x8B90
 
   ;8.98765432123456789e100
   ;float64_a3 = 0x54E4
   ;float64_a2 = 0x8BA9
   ;float64_a1 = 0x3D31
   ;float64_a0 = 0x747A
   ;gosub float64_ftoa
   ;end
   
start:
;-1001: C08F480000000000
;-2002: C09F480000000000
   ;float64_a3 = 0xC08F
   ;float64_a2 = 0x4800
   ;float64_a1 = 0x0000
   ;float64_a0 = 0x0000
   ;float64_b3 = 0xC09F
   ;float64_b2 = 0x4800
   ;float64_b1 = 0x0000
   ;float64_b0 = 0x0000
   
   ;gosub float64_div
   ;gosub float64_mul
   ;end


   ;float64_a3 = 0x4009
   ;float64_a2 = 0x21FB
   ;float64_a1 = 0x5452
   ;float64_a0 = 0x4550
   ;gosub float64_sqrt
   ;end
float64_a3 = float64_0_301_3
float64_a2 = float64_0_301_2
float64_a1 = float64_0_301_1
float64_a0 = float64_0_301_0
ptr = 0
gosub float64_ftoa
end

ptr = 0
@ptrinc = "-"
@ptrinc = "3"
@ptrinc = "1"
@ptrinc = "4"
@ptrinc = "1"
@ptrinc = "5"
@ptrinc = "9"
@ptrinc = "2"
@ptrinc = "6"
@ptrinc = "5"
@ptrinc = "4"
@ptrinc = "."
@ptrinc = "3"
@ptrinc = 0
ptr = 0
gosub float64_atof
end

#ifndef FLOAT64_DISABLE_CLEAR
float64_clear_a:
      float64_a0 = 0
      float64_a1 = 0
      float64_a2 = 0
      float64_a3 = 0
      return
 
float64_clear_b:
      float64_b0 = 0
      float64_b1 = 0
      float64_b2 = 0
      float64_b3 = 0
      return
#endif
 
#ifndef FLOAT64_DISABLE_SWAP
float64_swap:
      swap float64_a0,float64_b0
      swap float64_a1,float64_b1
      swap float64_a2,float64_b2
      swap float64_a3,float64_b3
      return
#endif
 
#ifndef FLOAT64_DISABLE_MOVE
float64_mova2b:
      float64_b0 = float64_a0
      float64_b1 = float64_a1
      float64_b2 = float64_a2
      float64_b3 = float64_a3
      return
 
float64_movb2a:
      float64_a0 = float64_b0
      float64_a1 = float64_b1
     float64_a2 = float64_b2
      float64_a3 = float64_b3
      return
#endif

float64_nega:
      float64_c = 1
      float64_a0 = not float64_a0
      float64_a1 = not float64_a1
      float64_a2 = not float64_a2
      float64_a3 = not float64_a3
      float64_ca = float64_a0_0+float64_c : float64_a0_0 = float64_a
      float64_ca = float64_a0_1+float64_c : float64_a0_1 = float64_a
      float64_ca = float64_a1_0+float64_c : float64_a1_0 = float64_a
      float64_ca = float64_a1_1+float64_c : float64_a1_1 = float64_a
      float64_ca = float64_a2_0+float64_c : float64_a2_0 = float64_a
      float64_ca = float64_a2_1+float64_c : float64_a2_1 = float64_a
      float64_ca = float64_a3_0+float64_c : float64_a3_0 = float64_a
      float64_ca = float64_a3_1+float64_c : float64_a3_1 = float64_a
      return
      
#ifndef FLOAT64_DISABLE_ADD
float64_add:
      gosub float64_unpack

      if float64_ax<float64_bx then
         float64_tb = float64_bx-float64_ax max 62
         do
           float64_a0 = float64_a0>>1
            float64_a0 = float64_a1<<15|float64_a0
            float64_a1 = float64_a1>>1
            float64_a1 = float64_a2<<15|float64_a1
            float64_a2 = float64_a2>>1
            float64_a2 = float64_a3<<15|float64_a2
            float64_a3 = float64_a3>>1
            dec float64_tb
         loop until float64_tb=0
         float64_ax = float64_bx
      elseif float64_ax>float64_bx then
         float64_tb = float64_ax-float64_bx max 62
         do
            float64_b0 = float64_b0>>1
            float64_b0 = float64_b1<<15|float64_b0
            float64_b1 = float64_b1>>1
            float64_b1 = float64_b2<<15|float64_b1
            float64_b2 = float64_b2>>1
            float64_b2 = float64_b3<<15|float64_b2
            float64_b3 = float64_b3>>1
            dec float64_tb
         loop until float64_tb=0
         float64_bx = float64_ax
      endif
 
      ;negate a?
      if float64_as=1 then
         gosub float64_nega
      endif
 
      ;negate b?
      if float64_bs=1 then
         float64_c = 1
         float64_b0 = not float64_b0
         float64_b1 = not float64_b1
         float64_b2 = not float64_b2
         float64_b3 = not float64_b3
         float64_ca = float64_b0_0+float64_c : float64_b0_0 = float64_a
         float64_ca = float64_b0_1+float64_c : float64_b0_1 = float64_a
         float64_ca = float64_b1_0+float64_c : float64_b1_0 = float64_a
         float64_ca = float64_b1_1+float64_c : float64_b1_1 = float64_a
         float64_ca = float64_b2_0+float64_c : float64_b2_0 = float64_a
         float64_ca = float64_b2_1+float64_c : float64_b2_1 = float64_a
         float64_ca = float64_b3_0+float64_c : float64_b3_0 = float64_a
         float64_ca = float64_b3_1+float64_c : float64_b3_1 = float64_a
      endif
 
      ;a=a+b
      float64_ca = 0
      float64_ca = float64_a0_0+float64_b0_0+float64_c : float64_a0_0 = float64_a
      float64_ca = float64_a0_1+float64_b0_1+float64_c : float64_a0_1 = float64_a
      float64_ca = float64_a1_0+float64_b1_0+float64_c : float64_a1_0 = float64_a
      float64_ca = float64_a1_1+float64_b1_1+float64_c : float64_a1_1 = float64_a
      float64_ca = float64_a2_0+float64_b2_0+float64_c : float64_a2_0 = float64_a
      float64_ca = float64_a2_1+float64_b2_1+float64_c : float64_a2_1 = float64_a
      float64_ca = float64_a3_0+float64_b3_0+float64_c : float64_a3_0 = float64_a
      float64_ca = float64_a3_1+float64_b3_1+float64_c : float64_a3_1 = float64_a
 
      ;negate a?
      float64_as = float64_a3>>15
      if float64_as=1 then
         gosub float64_nega
      endif
 
      gosub float64_normalize
      return
#endif
 
#ifndef FLOAT64_DISABLE_SUB
float64_sub:
      float64_b3 = float64_b3^0x8000
      gosub float64_add
      return
#endif
 
#ifndef FLOAT64_DISABLE_MUL
float64_mul:
      gosub float64_unpack
 
      float64_as = float64_as^float64_bs
      float64_ax = float64_ax-1023+float64_bx
 
      float64_t0 = 0
      float64_t1 = 0
      float64_t2 = 0
      float64_t3 = 0
      float64_tb = 64
 
      ; shift right b into carry
      float64_c0 = float64_b0&1
      float64_b0 = float64_b0>>1
      float64_b0 = float64_b1<<15|float64_b0
      float64_b1 = float64_b1>>1
      float64_b1 = float64_b2<<15|float64_b1
      float64_b2 = float64_b2>>1
      float64_b2 = float64_b3<<15|float64_b2
      float64_b3 = float64_b3>>1
 
      do
         float64_ca = 0
         if float64_c0=1 then
            float64_ca = float64_t0_0+float64_a0_0+float64_c : float64_t0_0 = float64_a
            float64_ca = float64_t0_1+float64_a0_1+float64_c : float64_t0_1 = float64_a
            float64_ca = float64_t1_0+float64_a1_0+float64_c : float64_t1_0 = float64_a
            float64_ca = float64_t1_1+float64_a1_1+float64_c : float64_t1_1 = float64_a
            float64_ca = float64_t2_0+float64_a2_0+float64_c : float64_t2_0 = float64_a
            float64_ca = float64_t2_1+float64_a2_1+float64_c : float64_t2_1 = float64_a
            float64_ca = float64_t3_0+float64_a3_0+float64_c : float64_t3_0 = float64_a
            float64_ca = float64_t3_1+float64_a3_1+float64_c : float64_t3_1 = float64_a
         endif

         ; rotate right t into carry
         float64_c1 = float64_c
         float64_c0 = float64_t0&1
         float64_t0 = float64_t0>>1
         float64_t0 = float64_t1<<15|float64_t0
         float64_t1 = float64_t1>>1
         float64_t1 = float64_t2<<15|float64_t1
         float64_t2 = float64_t2>>1
         float64_t2 = float64_t3<<15|float64_t2
         float64_t3 = float64_t3>>1
         float64_t3 = float64_c1<<15|float64_t3
 
         ; rotate right b into carry
         float64_c1 = float64_c0
         float64_c0 = float64_b0&1
         float64_b0 = float64_b0>>1
         float64_b0 = float64_b1<<15|float64_b0
         float64_b1 = float64_b1>>1
         float64_b1 = float64_b2<<15|float64_b1
         float64_b2 = float64_b2>>1
         float64_b2 = float64_b3<<15|float64_b2
         float64_b3 = float64_b3>>1
         float64_b3 = float64_c1<<15|float64_b3

         dec float64_tb
      loop until float64_tb=0
 
      ;justify result (shift left 3)
      float64_t3 = float64_t3<<3
      float64_t3 = float64_t2>>13|float64_t3
      float64_t2 = float64_t2<<3
      float64_t2 = float64_t1>>13|float64_t2
      float64_t1 = float64_t1<<3
      float64_t1 = float64_t0>>13|float64_t1
      float64_t0 = float64_t0<<3
      float64_a0 = float64_t0
      float64_a1 = float64_t1
      float64_a2 = float64_t2
      float64_a3 = float64_t3
      gosub float64_normalize
      return
#endif
 
#ifndef FLOAT64_DISABLE_DIV
float64_div:
      gosub float64_unpack

      float64_as = float64_as^float64_bs
      float64_ax = float64_ax-float64_bx+1023

      float64_t0 = 0
      float64_t1 = 0
      float64_t2 = 0
      float64_t3 = 0
      float64_tb = 62

      ; prepare b for ones subtract
      float64_b0 = not float64_b0
      float64_b1 = not float64_b1
      float64_b2 = not float64_b2
      float64_b3 = not float64_b3
      do
         ;shift left t
         float64_t3 = float64_t3<<1
         float64_t3 = float64_t2>>15|float64_t3
         float64_t2 = float64_t2<<1
         float64_t2 = float64_t1>>15|float64_t2
         float64_t1 = float64_t1<<1
         float64_t1 = float64_t0>>15|float64_t1
         float64_t0 = float64_t0<<1
 
         ;float64_a>=float64_b?
         float64_c = 1
         float64_ca = float64_a0_0+float64_b0_0+float64_c : float64_t4_0 = float64_a
         float64_ca = float64_a0_1+float64_b0_1+float64_c : float64_t4_1 = float64_a
         float64_ca = float64_a1_0+float64_b1_0+float64_c : float64_t5_0 = float64_a
         float64_ca = float64_a1_1+float64_b1_1+float64_c : float64_t5_1 = float64_a
         float64_ca = float64_a2_0+float64_b2_0+float64_c : float64_t6_0 = float64_a
         float64_ca = float64_a2_1+float64_b2_1+float64_c : float64_t6_1 = float64_a
         float64_ca = float64_a3_0+float64_b3_0+float64_c : float64_t7_0 = float64_a
         float64_ca = float64_a3_1+float64_b3_1+float64_c : float64_t7_1 = float64_a
 
         if float64_c=1 then
            ; a-b
            float64_a0 = float64_t4
            float64_a1 = float64_t5
            float64_a2 = float64_t6
            float64_a3 = float64_t7
 
            ;inc t (float64_c = 1)
            float64_ca = float64_t0_0+float64_c : float64_t0_0 = float64_a
            float64_ca = float64_t0_1+float64_c : float64_t0_1 = float64_a
            float64_ca = float64_t1_0+float64_c : float64_t1_0 = float64_a
            float64_ca = float64_t1_1+float64_c : float64_t1_1 = float64_a
            float64_ca = float64_t2_0+float64_c : float64_t2_0 = float64_a
            float64_ca = float64_t2_1+float64_c : float64_t2_1 = float64_a
            float64_ca = float64_t3_0+float64_c : float64_t3_0 = float64_a
            float64_ca = float64_t3_1+float64_c : float64_t3_1 = float64_a
         endif
 
         ;shift left a
         float64_a3 = float64_a3<<1
         float64_a3 = float64_a2>>15|float64_a3
         float64_a2 = float64_a2<<1
         float64_a2 = float64_a1>>15|float64_a2
         float64_a1 = float64_a1<<1
         float64_a1 = float64_a0>>15|float64_a1
         float64_a0 = float64_a0<<1
 
         ;loop
         dec float64_tb
      loop until float64_tb=0
 
      float64_a0 = float64_t0
      float64_a1 = float64_t1
      float64_a2 = float64_t2
      float64_a3 = float64_t3
      gosub float64_normalize
      return
#endif
 
#ifndef FLOAT64_DISABLE_SQRT
float64_sqrt:
      ;negative?
      if float64_a3>=0x8000 then
         gosub float64_clear_a
         return
      endif
      gosub float64_unpack
 
      ;if exponent is odd shift mantissa left
      float64_c0 = float64_ax&1
      if float64_c0=1 then
         float64_a3 = float64_a3<<1
         float64_a3 = float64_a2>>15|float64_a3
         float64_a2 = float64_a2<<1
         float64_a2 = float64_a1>>15|float64_a2
         float64_a1 = float64_a1<<1
         float64_a1 = float64_a0>>15|float64_a1
         float64_a0 = float64_a0<<1
      endif
      float64_ax = float64_ax>>1+float64_c0+511
 
      float64_t3 = 0x0000
      float64_t2 = 0x0000
      float64_t1 = 0x0000
      float64_t0 = 0x0000
      float64_t7 = 0x0000
      float64_t6 = 0x0000
      float64_t5 = 0x0000
      float64_t4 = 0x0000
      float64_tb = 52
      do
         ;get 2 bits of arg (t7, t6, t5, t4 and a3, a2, a1, a0) 
         float64_t7 = float64_t7<<2
         float64_t7 = float64_t6>>14|float64_t7
         float64_t6 = float64_t6<<2
         float64_t6 = float64_t5>>14|float64_t6
         float64_t5 = float64_t5<<2
         float64_t5 = float64_t4>>14|float64_t5
         float64_t4 = float64_t4<<2
         float64_t4 = float64_a3>>14|float64_t4
         float64_a3 = float64_a3<<2
         float64_a3 = float64_a2>>14|float64_a3
         float64_a2 = float64_a2<<2
         float64_a2 = float64_a1>>14|float64_a2
         float64_a1 = float64_a1<<2
         float64_a1 = float64_a0>>14|float64_a1
         float64_a0 = float64_a0<<2
 
         ;get ready for the next bit in the root (t3, t2, t1, t0)
         float64_t3 = float64_t3<<1
         float64_t3 = float64_t2>>15|float64_t3
         float64_t2 = float64_t2<<1
         float64_t2 = float64_t1>>15|float64_t2
         float64_t1 = float64_t1<<1
         float64_t1 = float64_t0>>15|float64_t1
         float64_t0 = float64_t0<<1
 
         ;test radical (u3, u2, u1, u0)
         float64_u3 = float64_t3<<1
         float64_u3 = float64_t2>>15|float64_u3
         float64_u2 = float64_t2<<1
         float64_u2 = float64_t1>>15|float64_u2
         float64_u1 = float64_t1<<1
         float64_u1 = float64_t0>>15|float64_u1
         float64_u0 = float64_t0<<1

         float64_c = 1
         float64_ca = float64_u0_0+float64_c : float64_u0_0 = float64_a
         float64_ca = float64_u0_1+float64_c : float64_u0_1 = float64_a
         float64_ca = float64_u1_0+float64_c : float64_u1_0 = float64_a
         float64_ca = float64_u1_1+float64_c : float64_u1_1 = float64_a
         float64_ca = float64_u2_0+float64_c : float64_u2_0 = float64_a
         float64_ca = float64_u2_1+float64_c : float64_u2_1 = float64_a
         float64_ca = float64_u3_0+float64_c : float64_u3_0 = float64_a
         float64_ca = float64_u3_1+float64_c : float64_u3_1 = float64_a

         ;t_7_6_5_4-u_3_2_1_0
         float64_c = 1
         float64_u0 = not float64_u0
         float64_u1 = not float64_u1
         float64_u2 = not float64_u2
         float64_u3 = not float64_u3
         float64_ca = float64_t4_0+float64_u0_0+float64_c : float64_b0_0 = float64_a
         float64_ca = float64_t4_1+float64_u0_1+float64_c : float64_b0_1 = float64_a
         float64_ca = float64_t5_0+float64_u1_0+float64_c : float64_b1_0 = float64_a
         float64_ca = float64_t5_1+float64_u1_1+float64_c : float64_b1_1 = float64_a
         float64_ca = float64_t6_0+float64_u2_0+float64_c : float64_b2_0 = float64_a
         float64_ca = float64_t6_1+float64_u2_1+float64_c : float64_b2_1 = float64_a
         float64_ca = float64_t7_0+float64_u3_0+float64_c : float64_b3_0 = float64_a
         float64_ca = float64_t7_1+float64_u3_1+float64_c : float64_b3_1 = float64_a

         if float64_c=1 then
            float64_t4 = float64_b0
            float64_t5 = float64_b1
            float64_t6 = float64_b2
            float64_t7 = float64_b3
            float64_ca = float64_t0_0+float64_c : float64_t0_0 = float64_a
            float64_ca = float64_t0_1+float64_c : float64_t0_1 = float64_a
            float64_ca = float64_t1_0+float64_c : float64_t1_0 = float64_a
            float64_ca = float64_t1_1+float64_c : float64_t1_1 = float64_a
            float64_ca = float64_t2_0+float64_c : float64_t2_0 = float64_a
            float64_ca = float64_t2_1+float64_c : float64_t2_1 = float64_a
            float64_ca = float64_t3_0+float64_c : float64_t3_0 = float64_a
            float64_ca = float64_t3_1+float64_c : float64_t3_1 = float64_a
         endif
 
         dec float64_tb
      loop while float64_tb>0
 
      ;align the msb
      float64_a3 = float64_t3
      float64_a2 = float64_t2
      float64_a1 = float64_t1
      float64_a0 = float64_t0
      if float64_a0!=0 or float64_a1!=0 or float64_a2!=0 or float64_a3!=0 then
         do while float64_a3<0x2000
            float64_a3 = float64_a3<<1
            float64_a3 = float64_a2>>15|float64_a3
            float64_a2 = float64_a2<<1
            float64_a2 = float64_a1>>15|float64_a2
            float64_a1 = float64_a1<<1
            float64_a1 = float64_a0>>15|float64_a1
            float64_a0 = float64_a0<<1
         loop
      endif
      gosub float64_pack
      return
#endif
 
#ifndef FLOAT64_DISABLE_CMP
float64_cmp:
      ;return value in byte pointed to by bptr
      ;return 0xff if a<b
      ;return 0x00 if a=b
      ;return 0x01 if a>b
      gosub float64_unpack
      @bptr = 0x1
      if float64_ax=float64_bx and float64_a3=0 and float64_a2=0 and float64_a1=0 and float64_a0=0 and float64_b3=0 and float64_b2=0 and float64_b1=0 and float64_b0=0 then
         @bptr = 0
      elseif float64_as!=float64_bs then
         if float64_as=1 then
            @bptr = 0xff
         endif
      elseif float64_ax=float64_bx and float64_a3=float64_b3 and float64_a2=float64_b2 and float64_a1=float64_b1 and float64_a0=float64_b0 then
         @bptr = 0
      elseif float64_ax<float64_bx then
         @bptr = 0xff
      elseif float64_ax=float64_bx then
         if float64_a3<float64_b3 then
            @bptr = 0xff
         elseif float64_a3=float64_b3 then
            if float64_a2<float64_b2 then
               @bptr = 0xff
            elseif float64_a2=float64_b2 then
               if float64_a1<float64_b1 then
                  @bptr = 0xff
               elseif float64_a1=float64_b1 then
                  if float64_a0<float64_b0 then
                     @bptr = 0xff
                  endif
               endif
            endif
         endif
      endif
      gosub float64_pack
      return
#endif
 
#ifndef FLOAT64_DISABLE_INT2FLOAT
float64_int2float:
      gosub float64_save
      ;negate if negative
      float64_as = float64_a3>>15
      if float64_as=1 then
         gosub float64_nega
      endif
 
      ;preset to 1023+61 then adjust with normalize
      float64_ax = 1084
      gosub float64_normalize
      return
#endif
 
#ifndef FLOAT64_DISABLE_FLOAT2INT
float64_float2int:
      gosub float64_unpack
      ;exponent in range 0-62?
      if float64_ax<1023 or float64_ax>1085 then
         gosub float64_clear_a
         gosub float64_restore
         return
      endif
 
      ;msb justify (shift left 1)
      float64_a3 = float64_a3<<1
      float64_a3 = float64_a2>>15|float64_a3
      float64_a2 = float64_a2<<1
      float64_a2 = float64_a1>>15|float64_a2
      float64_a1 = float64_a1<<1
      float64_a1 = float64_a0>>15|float64_a1
      float64_a0 = float64_a0<<1
 
      ;shift down
      float64_tb = 1085-float64_ax
      do while float64_tb>0
         float64_a0 = float64_a0>>1
         float64_a0 = float64_a1<<15|float64_a0
         float64_a1 = float64_a1>>1
         float64_a1 = float64_a2<<15|float64_a1
         float64_a2 = float64_a2>>1
         float64_a2 = float64_a3<<15|float64_a2
         float64_a3 = float64_a3>>1
         dec float64_tb
      loop
 
      ;negate if float was negative
      if float64_as=1 then
         gosub float64_nega
      endif
      gosub float64_restore
      return
#endif
 
#ifndef FLOAT64_DISABLE_FRAC
float64_frac:
      gosub float64_unpack
      if float64_ax<1023 then
         gosub float64_pack
         return
      endif
      float64_tb = float64_ax-1023 max 52
      do while float64_tb>0
         float64_a3 = float64_a3<<1
         float64_a3 = float64_a2>>15|float64_a3
         float64_a2 = float64_a2<<1
         float64_a2 = float64_a1>>15|float64_a2
         float64_a1 = float64_a1<<1
         float64_a1 = float64_a0>>15|float64_a1
         float64_a0 = float64_a0<<1
         dec float64_tb
      loop
      float64_a3 = float64_a3&0x1fff
      float64_ax = 1023
      gosub float64_normalize
      return
#endif
 
#ifndef FLOAT64_DISABLE_MOD
float64_mod:
      ;a = mod(a,b)
      poke 0x80,word float64_a0
      poke 0x82,word float64_a1
      poke 0x84,word float64_a2
      poke 0x86,word float64_a3
      gosub float64_div
      gosub float64_float2int
      gosub float64_int2float
      gosub float64_mul
      gosub float64_mova2b
      peek 0x80,word float64_a0
      peek 0x82,word float64_a1
      peek 0x84,word float64_a2
      peek 0x86,word float64_a3
      gosub float64_sub
      return
#endif
 
#ifndef FLOAT64_DISABLE_ABS
float64_abs:
      float64_a3 = float64_a3&0x7fff
      return
#endif
 
#ifndef FLOAT64_DISABLE_ATOF
float64_atof:
      pushram
      w5 = 0;
      gosub float64_clear_a
      do
         b0 = @ptrinc
         select b0
            case 0
               exit
            case "-"
               w5 = 0x8000
            case "0" to "9"
               float64_b3 = float64_10_3
               float64_b2 = float64_10_2
               float64_b1 = float64_10_1
               float64_b0 = float64_10_0
               gosub float64_mul
               gosub float64_mova2b
               float64_a3 = 0
               float64_a2 = 0
               float64_a1 = 0
               float64_a0 = b0-"0"
               gosub float64_int2float
               gosub float64_add
            case "."  
               float64_p10_3 = float64_0_1_3
               float64_p10_2 = float64_0_1_2
               float64_p10_1 = float64_0_1_1
               float64_p10_0 = float64_0_1_0
               push b55,b54,b53,b52,b51,b50,b49,b48
               do
                  b0 = @ptrinc
                  select b0
                     case 0
                        exit
                     case "0" to "9"
                        float64_a3 = 0
                        float64_a2 = 0
                        float64_a1 = 0
                        float64_a0 = b0-"0"
                        float64_b3 = float64_p10_3
                        float64_b2 = float64_p10_2
                        float64_b1 = float64_p10_1
                        float64_b0 = float64_p10_0
                        gosub float64_int2float
                        gosub float64_mul
                        gosub float64_mova2b:
                        pop b48,b49,b50,b51,b52,b53,b54,b55
                        gosub float64_add
                        push b55,b54,b53,b52,b51,b50,b49,b48
                        float64_a3 = float64_p10_3
                        float64_a2 = float64_p10_2
                        float64_a1 = float64_p10_1
                        float64_a0 = float64_p10_0
                        float64_b3 = float64_0_1_3
                        float64_b2 = float64_0_1_2
                        float64_b1 = float64_0_1_1
                        float64_b0 = float64_0_1_0
                        gosub float64_mul
                        float64_p10_3 = float64_a3
                        float64_p10_2 = float64_a2
                        float64_p10_1 = float64_a1
                        float64_p10_0 = float64_a0
                  endselect 
               loop
               pop b48,b49,b50,b51,b52,b53,b54,b55
               exit
         endselect
      loop
      float64_a3 = float64_a3|w5
      popram
      return
#endif

#ifndef FLOAT64_DISABLE_FTOA
float64_pow10:
      ; w0 has signed integer exponent
      ; returns 10 to the power of -w0
      pushram
      float64_a3 = float64_1_3
      float64_a2 = float64_1_2
      float64_a1 = float64_1_1
      float64_a0 = float64_1_0
      float64_p10_3 = float64_10_3
      float64_p10_2 = float64_10_2
      float64_p10_1 = float64_10_1
      float64_p10_0 = float64_10_0
      w0 = -w0
      if w0>0x7fff then
         float64_p10_3 = float64_0_1_3
         float64_p10_2 = float64_0_1_2
         float64_p10_1 = float64_0_1_1
         float64_p10_0 = float64_0_1_0
         w0 = -w0
      endif
      do while w0>0
         float64_b3 = float64_p10_3
         float64_b2 = float64_p10_2
         float64_b1 = float64_p10_1
         float64_b0 = float64_p10_0
         if bit0=1 then
            gosub float64_mul
         endif
         push b55,b54,b53,b52,b51,b50,b49,b48
         float64_a3 = float64_p10_3
         float64_a2 = float64_p10_2
         float64_a1 = float64_p10_1
         float64_a0 = float64_p10_0
         gosub float64_mul
         float64_p10_3 = float64_a3
         float64_p10_2 = float64_a2
         float64_p10_1 = float64_a1
         float64_p10_0 = float64_a0
         pop b48,b49,b50,b51,b52,b53,b54,b55
         w0 = w0>>1
      loop
      popram
      return
      
float64_ftoa:
      pushram
      w1 = ptr
      if float64_a3=0 or float64_a3=0x8000 and float64_a2=0 and float64_a1=0 and float64_a0=0 then
         @ptrinc = "0"
         @ptrinc = 0
         ptr = w1
         popram
         return
      endif
      if float64_a3>0x7fff then
         float64_a3 = float64_a3&0x7fff
         @ptrinc = "-"
      endif
      push b55,b54,b53,b52,b51,b50,b49,b48
      w0 = float64_a3>>4&0x07ff-1023
      float64_a3 = 0
      float64_a2 = 0
      float64_a1 = 0
      if w0>0x7fff then
         float64_a3 = 0xffff
         float64_a2 = 0xffff
         float64_a1 = 0xffff
      endif
      float64_a0 = w0
      gosub float64_int2float
      float64_b3 = float64_0_301_3
      float64_b2 = float64_0_301_2
      float64_b1 = float64_0_301_1
      float64_b0 = float64_0_301_0
      gosub float64_mul
      gosub float64_float2int
      w0 = float64_a0
      gosub float64_pow10
      gosub float64_mova2b
      pop b48,b49,b50,b51,b52,b53,b54,b55
      gosub float64_mul
 
      ;get within 1 and 10
      float64_b3 = float64_10_3
      float64_b2 = float64_10_2
      float64_b1 = float64_10_1
      float64_b0 = float64_10_0
      do while float64_a3<0x3ff0
         gosub float64_mul
         dec w0
      loop
      float64_b3 = float64_0_1_3
      float64_b2 = float64_0_1_2
      float64_b1 = float64_0_1_1
      float64_b0 = float64_0_1_0
      do while float64_a3>=0x4024
         gosub float64_mul
         inc w0
      loop
 
      for b4=0 to 14
         push b55,b54,b53,b52,b51,b50,b49,b48
         gosub float64_float2int
         @ptrinc = float64_a0+"0"
         if b4=0 then
            @ptrinc = "."
         endif
         pop b48,b49,b50,b51,b52,b53,b54,b55
         gosub float64_frac
         float64_b3 = float64_10_3
         float64_b2 = float64_10_2
         float64_b1 = float64_10_1
         float64_b0 = float64_10_0
         gosub float64_mul
      next
      dec ptr
      for b4=0 to 12
         if @ptr="0" then
            dec ptr
         else
            exit
         endif
      next
      inc ptr
      if w0!=0 then
         @ptrinc = "e"
         if w0>0x7fff then
            @ptrinc = "-"
            w0 = -w0
         endif
         bintoascii w0,b4,b5,b6,b7,b8
         b4 = 0
         if b5!="0" then : @ptrinc = b5 : b4 = 1 endif
         if b6!="0" or b4=1 then : @ptrinc = b6 : b4 = 1 : endif
         if b7!="0" or b4=1 then : @ptrinc = b7 : b4 = 1 : endif
         @ptrinc = b8
      endif
      @ptr = 0
      ptr = w1
      popram
      return
#endif

float64_normalize:
      if float64_a0=0 and float64_a1=0 and float64_a2=0 and float64_a3=0 then
         float64_ax = 0
         float64_as = 0
         gosub float64_pack
         return
      endif
      if float64_a3>=0x4000 then
         float64_a0 = float64_a0>>1
         float64_a0 = float64_a1<<15|float64_a0
         float64_a1 = float64_a1>>1
         float64_a1 = float64_a2<<15|float64_a1
         float64_a2 = float64_a2>>1
         float64_a2 = float64_a3<<15|float64_a2
         float64_a3 = float64_a3>>1
         inc float64_ax
      else
         do while float64_a3<0x2000
            float64_a3 = float64_a3<<1
            float64_a3 = float64_a2>>15|float64_a3
            float64_a2 = float64_a2<<1
            float64_a2 = float64_a1>>15|float64_a2
            float64_a1 = float64_a1<<1
            float64_a1 = float64_a0>>15|float64_a1
            float64_a0 = float64_a0<<1
            dec float64_ax
         loop
      endif

      float64_c = 1
      float64_ca = float64_a0_1+float64_c : float64_a0_1 = float64_a
      float64_ca = float64_a1_0+float64_c : float64_a1_0 = float64_a
      float64_ca = float64_a1_1+float64_c : float64_a1_1 = float64_a
      float64_ca = float64_a2_0+float64_c : float64_a2_0 = float64_a
      float64_ca = float64_a2_1+float64_c : float64_a2_1 = float64_a
      float64_ca = float64_a3_0+float64_c : float64_a3_0 = float64_a
      float64_ca = float64_a3_1+float64_c : float64_a3_1 = float64_a
      if float64_a3>=0x4000 then
         float64_a0 = float64_a0>>1
         float64_a0 = float64_a1<<15|float64_a0
         float64_a1 = float64_a1>>1
         float64_a1 = float64_a2<<15|float64_a1
         float64_a2 = float64_a2>>1
         float64_a2 = float64_a3<<15|float64_a2
         float64_a3 = float64_a3>>1
         inc float64_ax
      endif
      gosub float64_pack
      return
 
float64_pack:
      float64_a0 = float64_a0>>9
      float64_a0 = float64_a1<<7|float64_a0
      float64_a1 = float64_a1>>9
      float64_a1 = float64_a2<<7|float64_a1
      float64_a2 = float64_a2>>9
      float64_a2 = float64_a3<<7|float64_a2
      float64_a3 = float64_a3>>9&0x000f
      float64_a3 = float64_ax<<4&0x7ff0|float64_a3
      float64_a3 = float64_as<<15|float64_a3
      gosub float64_restore
      return
 
float64_unpack:
      ;save registers
      gosub float64_save
      ;unpack
      float64_ax = float64_a3>>4&0x07ff
      if float64_ax=0 then
         float64_as = 0
         float64_a3 = 0
         float64_a2 = 0
         float64_a1 = 0
         float64_a0 = 0
      else
         float64_as = float64_a3>>15
         float64_a3 = float64_a3<<9&0x1fff|0x2000
         float64_a3 = float64_a2>>7|float64_a3
         float64_a2 = float64_a2<<9
         float64_a2 = float64_a1>>7|float64_a2
         float64_a1 = float64_a1<<9
         float64_a1 = float64_a0>>7|float64_a1
         float64_a0 = float64_a0<<9
      endif
      float64_bx = float64_b3>>4&0x07ff
      if float64_bx=0 then
         float64_bs = 0
         float64_b3 = 0
         float64_b2 = 0
         float64_b1 = 0
        float64_b0 = 0
      else
         float64_bs = float64_b3>>15
         float64_b3 = float64_b3<<9&0x1fff|0x2000
         float64_b3 = float64_b2>>7|float64_b3
         float64_b2 = float64_b2<<9
         float64_b2 = float64_b1>>7|float64_b2
         float64_b1 = float64_b1<<9
         float64_b1 = float64_b0>>7|float64_b1
         float64_b0 = float64_b0<<9
      endif
      return
 
float64_save:
      ;save registers in storage
      poke 0x7e,word w23
      poke 0x7c,word w22
      poke 0x7a,word w21
      poke 0x78,word w20
      poke 0x76,word w19
      poke 0x74,word w18
      poke 0x72,word w17
      poke 0x70,word w16
      poke 0x6e,word w15
      poke 0x6c,word w14
      poke 0x6a,word w13
      poke 0x68,word w12
      poke 0x66,word w11
      poke 0x64,word w10
      poke 0x62,word w9
      poke 0x60,word w8
      poke 0x5e,word w7
      poke 0x5c,word w6
      poke 0x5a,word w5
      poke 0x58,word w4
      poke 0x56,word w3
      poke 0x54,word w2
      poke 0x52,word w1
      poke 0x50,word w0
      return
 
float64_restore:
      ;restore registers from storage
      peek 0x7e,word w23
      peek 0x7c,word w22
      peek 0x7a,word w21
      peek 0x78,word w20
      peek 0x76,word w19
      peek 0x74,word w18
      peek 0x72,word w17
      peek 0x70,word w16
      peek 0x6e,word w15
      peek 0x6c,word w14
      peek 0x6a,word w13
      peek 0x68,word w12
      peek 0x66,word w11
      peek 0x64,word w10
      peek 0x62,word w9
      peek 0x60,word w8
      peek 0x5e,word w7
      peek 0x5c,word w6
      peek 0x5a,word w5
      peek 0x58,word w4
      peek 0x56,word w3
      peek 0x54,word w2
      peek 0x52,word w1
      peek 0x50,word w0
      return
 
