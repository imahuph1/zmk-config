/*
 * Copyright (c) 2020 The ZMK Contributors
 *
 * SPDX-License-Identifier: MIT
 */

#include <behaviors.dtsi>
#include <dt-bindings/zmk/keys.h>
#include <dt-bindings/zmk/bt.h>
#include <dt-bindings/zmk/rgb.h>

#define AS(keycode) &as LS(keycode) keycode     // Autoshift Macro

&led_strip {
    chain-length = <27>;
};

&mt {
        tapping-term-ms = <400>;
        quick-tap-ms = <175>;
        require-prior-idle-ms = <150>;
        flavor = "balanced";
};


/ {
        
         behaviors {
            as: auto_shift {
            compatible = "zmk,behavior-hold-tap";
            #binding-cells = <2>;
            tapping_term_ms = <135>;
            quick_tap_ms = <0>;
            flavor = "tap-preferred";
            bindings = <&kp>, <&kp>;
                };
        };


        keymap {
                compatible = "zmk,keymap";

                default_layer {
// -----------------------------------------------------------------------------------------
// | none |  Q  |  W  |  E  |  R  |  T  |   |  Y  |  U   |  I  |  O  |  P  | none |
// | none |  A  |  S  |  D  |  F  |  G  |   |  H  |  J   |  K  |  L  |  '  | none |
// | none |  Z  |  X  |  C  |  V  |  B  |   |  N  |  M   |  ,  |  .  |  /  | none |
//                    | GUI | LWR | ENT |   | SPC | RSE  | ESC |
                        bindings = <
   &none AS(Q) AS(W) AS(E) AS(R) AS(T)   AS(Y) AS(U)  AS(I)     AS(O)   AS(P)    &none
   &none AS(A) AS(S) AS(D) AS(F) AS(G)   AS(H) AS(J)  AS(K)     AS(L)   AS(SQT)  &none
   &none AS(Z) AS(X) AS(C) AS(V) AS(B)   AS(N) AS(M)  AS(COMMA) AS(DOT) AS(FSLH) &none
                &kp LGUI &mo 1 &kp RET     &kp SPACE &mo 2 &mt LCTRL ESC
                        >;
                };
                lower_layer {
// -----------------------------------------------------------------------------------------
// | none |  1    |  2  |  3  |  4  |  5  |   |  6  |  7  |  8  |  9  |  0  | none |
// | none | BTCLR | BT0 | BT1 | BT2 | BT3 |   | LFT | DWN |  UP | RGT |     | none |
// | none |       | HOME| PGUP| PGDN| END |   |     |     |     |     |     | none |
//                      | GUI |     | ENT |   | SPC |     |     |
                        bindings = <
   &trans AS(N1)     AS(N2)       AS(N3)       AS(N4)       AS(N5)         AS(N6)   AS(N7)   AS(N8)  AS(N9)    AS(N0) &trans
   &trans &bt BT_CLR &bt BT_SEL 0 &bt BT_SEL 1 &bt BT_SEL 2 &bt BT_SEL 3   &kp LEFT &kp DOWN &kp UP  &kp RIGHT &trans  &trans
   &trans &trans     &kp HOME     &kp PG_UP    &kp PG_DN    &kp END        &trans   &trans   &trans  &trans    &trans  &trans
                                        &kp LGUI   &trans   &kp RET           &kp SPACE   &trans   &trans
                        >;
                };

                raise_layer {
// -----------------------------------------------------------------------------------------
// | none |   !   |   @   |   #   |   $   |   %   |   |  ^  |  &  |  *  |  (  |  )  | none |
// | none |       |       |       |       |STUDIO |   |  -  |  =  |  [  |  ]  |  \  | none |
// | none |       |       |       |       |       |   |  _  |  +  |  {  |  }  | "|" | none |
//                            | GUI |     |  ENT  |   | SPC |     |     |
                        bindings = <
   &trans &kp EXCL  &kp AT &kp HASH  &kp DLLR  &kp PRCNT      &kp CARET &kp AMPS  &kp KP_MULTIPLY &kp LPAR &kp RPAR &trans
   &trans &trans    &trans &trans    &trans    &studio_unlock &kp MINUS &kp EQUAL &kp LBKT        &kp RBKT &kp BSLH &trans
   &trans &trans    &trans &trans    &trans    &trans         &kp UNDER &kp PLUS  &kp LBRC        &kp RBRC &kp PIPE &trans
                        &kp LGUI   &trans   &kp RET             &kp SPACE   &trans    &trans
                        >;
                };
        };
};
