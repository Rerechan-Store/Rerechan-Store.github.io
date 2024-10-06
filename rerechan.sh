#!/bin/bash
#
# This file encrypted at Sat Apr 27 07:50:49 PM WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Region: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | oW:iS:Jy:qq:f9:vD:FN:d0:Qt:XD:ch:Fv:4t:lb:yk:Hd:GU:um:cb:8M:cX:w6:m6:bi:8I:gw:xS:t7:7N:dX:DP:lJ:lu:N7:DU:yL:Hh:DQ:jA:M1:Os:0e:Yo:XO:Yz:lC:gm:Y5:eM:Be:Pf:KV:36:vp:JB:h4:Lv:5m:mS:or:ZV:P5:sE:E5:xg:aa:sM:d6:7v:T2:1i:O4:Wk:IZ:Ir:RA:wz:MI:qW:fC:Pr:2D:qG:bj:cX:af:Dn:HO:xh:tY:wI:Q6:DO:l7:GC:04:Au:8J:pB:lV:Gx:aH:vO:Uw:ts:G5:uG:ly:rr:td:eH:qY:Jm:AZ:RY:44:xX:FF:O3:LB:m4:I1:lk:K0:Pj:so:Hb:c0:Hv:c8:NU:EV:qf:Hk:8N:Fm:1o:q1:5M:pS:Ua:Lr:B4:Rz:bI:Vj:gN:qf:RJ:Fd:7O:Cq:ya:2D:1O:7o:MT:io:pJ:Ba:fH:X0:yD:BP:MJ:T1:Ck:i8:9U:h2:o3:9k:tT:Ce:9P:gS:3o:lT:4j:GV:wT:2Z:lP:8i:Bi:9B:tM:q1:s3:3b:hl:Xp:L6:FA:Ud:Db:9z:qy:Hh:WX:eF:v3:k7:0S:cN:ol:dr:uX:8t:Eb:WH:xb:nx:vW:lB:Mz:TZ:F3:3O:at:fb:uP:MB:6O:NW:C2:tL:u4:UU:7N:BQ:uJ:BY:Rz:rA:qW:Rj:Ku:Y7:Dx:TQ:qC:my:Tg:d9:NZ:hp:iI:Xf:0r:En:q9:uX:34:VV:YR:fF:R1:8s:23:9E:Wq:I3:9q:VX:Vn:uC:KM:0I:Fi:0i:M5:Z2:sI:Ci:g5:xy:4X:eE:jk:VQ:1N:g9:Wn:oD:jI:Se:bP:vQ:Ku:eD:kz:9g:2l:yP:1N:ew:A6:0P:n8:X7:Vk:sQ:td:yx:m7:KD:Sv:VN:6h:mZ:cx:9o:sD:UW:ry:au:zg:gV:HN:Z4:mT:pw:Uu:z7:sG:Sq:sx:fT:bv:XR:B9:1Y:dg:rV:Ri:H3:6t:JX:rt:fb:ow:dc:a4:br:4j:4j:M5:wg:q0:iY:47:K7:EL:9O:D7:uJ:ZK:1A:TL:xu:Qu:Gh:QL:ak:bS:Hm:jw:WE:ig:36:se:dI:SP:Aj:m3:nk:3S:Jh:bJ:vr:nA:gX:WH:6C:3J:ye:t9:b6:x7:Gh:Cp:3e:dF:tP:9U:Ge:OQ:33:Mw:5p:r8:yS:vf:EW:Hg:If:AH:oB:1P:NR:Vb:AQ:MK:YT:pb:oy:KI:kv:2n:Nd:Zu:gN:6z:sQ:GS:dD:HT:rk:6g:Kk:Pe:Bt:Os:rk:M6:jO:5o:Dw:JQ:jt:iw:VW:Vu:hP:Tp:1r:32:RX:Rv:g7:lC:4n:KY:IF:dh:dQ:Ok:Nu:mr:dr:WX:HY:F8:sW:Mc:ZW:kZ:rm:Fc:kO:GA:oW:AK:8m:aI:I2:ZO:cV:Wp:wO:a1:pz:oy:0y:iy:vQ:7H:vB:oP:OE:f2:kV:B8:JW:3G:pV:kv:88:6w:pK:UH:3n:yv:KQ:hX:Jf:2J:Gm:u6:LQ:sr:NY:3a:xR:GR:eU:j4:8p:Fw:BE:MM:RD:oM:O3:px:9Q:1x:Lk:au:L0:KO:gr:22:4a:Nt:W4:Ks:jN:ul:KR:iw:da:gn:NR:gd:vj:nt:cE:s1:Y7:SV:4A:NV:Pi:fM:j0:Uq:48:CD:c3:9e:hs:kI:vR:fG:WM:G8:mL:sU:ks:jn:Y5:Ip:bo:WA:4m:HL:T3:Kg:Ne:zn:e7:5O:FO:4h:gq:Go:LP:wx:HG:53:Yp:W3:AU:Ef:3F:IO:fc:Sk:os:nd:F8:vi:Ih:pR:xO:BM:Mn:ZA:Va:5J:Re:Jp:L9:BU:eb:Pn:GE:pl:C3:Iv:vm:yO:0t:4X:Wo:tJ:Ut:na:HE:CF:k7:Lj:sg:Xy:sK:Jm:tF:9D:29:6M:Vl:CC:eE:6F:U4:YI:ed:SO:bN:bg:Ja:yt:tE:8F:PD:71:Gg:ep:0H:WQ:Ko:Bm:ou:ji:PJ:WT:IC:uU:pO:vd:sV:TL:rR:Vv:Zt:pq:r3:5E:jg:pZ:VL:no:ej:ne:B1:p3:Un:eQ:Hk:hm:RR:Pr:wJ:tx:qN:AO:h4:Re:3V:nq:Qj:zR:C4:wK:Ee:dI:u3:wg:Qy:Ed:oG:YY:Z4:Eh:7u:3G:tg:aP:8a:o7:K8:Bx:zO:i6:hF:1e:XX:tX:s7:cF:bx:De:bd:Wx:1u:T1:De:mi:I4:sv:tu:oB:AN:IM:3J:J6:zS:YB:4i:oW:Kx:Dd:GF:8F:Gs:2E:CG:J3:Af:kJ:EU:D9:V3:S4:th:KR:Qb:DX:vc:Dt:Zm:t8:EF:9q:YH:J0:Q5:uT:zn:3P:kl:Xu:AA:hQ:B0:SI:Oo:H9:Qg:N3:ye:uA:ty:RG:ty:Tf:Sw:5X:IP:Wj:Fe:Hu:ER:QS:yf:uX:w1:NQ:Uc:Tq:8v:5G:NL:6w:Yq:zj:un:R0:s4:4I:PD:Or:1J:xz:jH:JV:vo:dF:Nw:uE:Zf:27:QQ:RA:J5:bT:BG:oS:S8:6l:08:fX:Z9:n9:Vr:6R:Fu:jo:2j:LS:3Q:KK:0A:0N:sd:6J:2F:jO:Hi:H2:2w:42:nb:pn:j7:Wl:L2:Yn:7X:vA:P1:yW:Gu:3e:CX:ar:pk:EL:yv:QF:Qg:cA:fa:UC:Up:Z1:wl:TG:V6:DJ:CT:wh:pa:Oz:CO:ol:jP:vF:Pi:Vy:xm:Rs:Qy:MS:bI:Sd:Ro:JU:Ld:LX:GD:Ro:5j:7r:8H:KF:SS:Ps:SN:ns:Ht:Me:HQ:Ai:E3:2D:Pc:qD:Go:z2:gu:vl:bi:c5:Zh:ai:Od:hi:ID:hl:nY:X4:Ym:jL:yb:gM:8d:fe:pn:56:Ex:RO:Lb:Tm:2V:Ej:8W:Br:KL:mF:W8:9j:i6:Mo:f3:Xe:Cr:DY:mo:Hx:Lm:cP:Tl:6L:O5:dX:dD:pB:Ym:0o:Md:ms:C9:kI:UO:O0:0W:3F:13:sS:0l:63:Yi:I6:iG:ML:3z:r0:4t:Lb:dK:S6:x4:9Q:s2:PR:5o:Og:pG:Y2:lK:C9:Xu:CJ:6e:rp:qd:6H:w9:zx:zI:R8:sQ:Ba:HY:7G:4N:LV:4G:hZ:hn:DH:we:x5:bT:O5:AQ:bJ:7k:0g:N9:i9:hb:rE:FN:S5:Cl:Dw:ha:5b:Xr:xo:jc:75:wo:eo:Jb:Tt:S5:P7:fR:31:3H:Py:Xl:nJ:Gk:Ey:9k:Bh:Xn:1j:nA:c9:bL:wn:JH:4o:6H:MI:SH:rQ:3e:Lg:Fb:Xw:g3:ho:UJ:68:JQ:yt:R4:Zc:yT:SQ:og:Ji:wP:GY:5E:0w:i2:tq:mj:82:IY:dK:1v:jo:ga:nF:ji:6N:Dk:1F:lU:7B:X0:Dt:Z0:59:4s:lL:Iq:nw:Cw:A0:31:m1:ZS:2s:JN:TR:ah:Rt:zQ:wt:4Q:1T:s8:Qy:7I:Ns:tA:oA:GI:oP:vC:2r:wI:4D:uG:F1:St:3a:mY:q5:8u:nC:1l:PQ:2I:te:dh:xV:Ks:ti:mJ:Gr:7A:jc:hm:Cb:kZ:JH:3c:xd:TL:yy:hu:vl:YT:Ra:jj:8q:hl:gx:9s:xL:NA:AN:zV:ON:xL:V9:n0:8E:gO:5J:pz:Vs:02:YZ:Ia:T4:xE:kQ:1f:VY:AI:IC:eu:bt:jr:WD:DQ:LX:2y:Bp:JR:AW:zB:R6:Oe:az:Nv:1I:MX:ad:1U:5l:ca:tH:sI:iD:Qu:YY:6I:GT:hV:Tc:GA:z1:90:mh:CG:fI:t2:HQ:ul:jC:hr:a3:TA:nd:93:vE:yJ:Z4:pJ:wc:re:mU:ef:0Y:dO:aY:0y:Qo:aW:2r:Qp:2C:gS:42:xq:Md:Sw:dC:ui:QA:tN:be:LT:m9:nV:zZ:KG:a8:I5:gl:U5:7p:2t:bp:cy:VU:N0:nl:21:Sf:k8:e1:Vq:oC:bF:QG:f3:Yu:P2:CP:M7:oE:HX:u1:sr:y6:vD:1M:n6:Ka:Ix:kG:1L:xH:hP:SI:Yy:IE:Bq:YN:7m:Lo:zx:Vd:Ft:tB:pe:C9:FB:2C:SZ:TR:Fz:gT:Ko:ey:Ib:pT:ZU:a7:ai:uR:MT:Rv:bB:zx:pd:b3:Fv:VY:Sl:io:6Z:cw:QE:1A:Xk:QN:JQ:ma:mf:dx:D0:DA:hl:r7:VZ:pu:jr:UV:xW:ps:5X:qx:93:fL:R1:Qm:hn:Z0:EQ:ae:gm:QF:B7:v9:K0:Mi:Vw:0Z:Kb:v3:iO:Ws:JR:Rn:QA:t7:bS:gn:2E:P9:c7:Bn:aG:95:9G:tv:DF:1K:tP:9J:Gs:rA:U1:YI:2e:hb:qe:xk:5W:kl:9d:q6:sY:D0:kH:nl:a2:Rh:Vk:oU:Hv:Jb:y0:QZ:hr:zj:iY:WK:Wr:mk:yb:Fv:wB:mY:CY:zo:KE:g6:gM:ub:k1:fl:i4:vX:fo:ci:Kx:Nq:4d:Zc:5p:Qf:lN:SV:DT:q5:W6:4O:K4:YJ:qa:Ke:dq:wQ:ei:wm:PS:Lx:4v:K2:sR:sm:V6:ZM:1B:Iq:Dw:Ah:pb:Pk:0M:bh:Y1:LK:2j:7a:YC:9Y:Ur:on:Jp:5J:rd:Yo:5h:T7:dt:uD:62:O2:M5:4Y:qX:PM:5K:pL:ij:cs:Y7:Ap:GJ:tF:bW:Xy:pg:JX:wC:FW:nj:oj:sF:Ui:8x:ps:uD:7S:Lr:p2:fF:G5:mq:7n:Hb:Ak:pG:A4:kS:zN:BB:sO:ng:hf:rC:0I:oi:ws:Jz:EJ:Eo:OK:fJ:Zg:UL:HN:Qm:4G:Ih:eM:xs:29:j3:t7:7m:O5:HS:de:jn:oF:v8:Uc:Tg:xa:6k:xT:ua:sL:sX:fw:jj:Cz:GX:45:Mi:s2:as:si:Yo:WN:SV:Pl:Jf:E5:Bi:kJ:OY:Fo:d7:sk:lk:Jy:4v:N4:17:Xa:xT:nW:Uz:de:Bb:9F:zk:nm:He:a4:Rf:sK:Pi:8o:HA:Pc:XT:Od:kZ:VR:Gj:Iz:6r:88:6X:rN:qd:xy:La:8v:hd:f4:io:O0:AL:20:dj:ws:OI:rF:V6:0r:gk:Qz:yy:vT:ek:cx:nB:My:UG:gW:l9:IV:vR:Xn:oa:KR:o1:E8:s9:sJ:uf:Ie:GE:ik:zJ:08:Lc:sh:9H:33:Qw:DU:lj:eB:Aq:XN:CY:xB:PX:Bs:rQ:7n:ul:g7:jQ:hT:e4:Ko:HS:PE:ZF:aA:Gi:sC:qE:ty:lg:56:hq:1p:3B:UQ:ni:UI:8g:ld:oH:57:Xv:zW:Ys:78:oo:vG:AN:fl:YN:Xk:xo:SN:Op:uH:DT:Pn:N8:b8:ch:Pw:Fs:hC:6Y:WK:PY:rE:d3:ls:QW:B4:zI:du:yD:RX:sl:mI:MV:28:94:r5:A5:j4:9K:ZN:LH:aA:Zd:3z:kz:7p:lt:dL:2G:NB:OS:E0:tv:QI:Uk:St:GO:Om:o3:qY:I1:5K:Yv:P4:AX:X2:Yx:bT:O2:kt:4Y:HF:Jy:Dg:nV:dD:rC:VE:aZ:Ro:1z:J8:TM:xR:Rc:o5:YR:5n:g6:Kq:rI:dT:aY:eU:f1:lo:og:Vl:Rp:Mh:D7:XL:v5:R4:3S:mo:cq:Rj:Re:SC:wD:Qg:fD:xy:Ba:R7:qZ:55:0u:xY:FV:ss:Jz:72:V2:tx:Ng:BV:Ul:TF:yd:zU:b5:PT:CJ:FS:St:hW:Da:DF:vQ:ln:HS:tf:pB:Bp:4K:o8:k7:IW:9W:Tl:XW:w2:Yy:wB:2t:zE:Gh:Oj:eN:Sh:w2:PH:ZL:2S:Lh:Il:QG:Io:UR:Bt:Fm:Kg:lx:Vj:e1:ZC:fl:Td:6B:AX:iN:7o:Jc:dv:IL:vy:pa:Yi:Z1:8a:Mm:cz:6j:hc:eh:Jo:ZU:CF:gU:ms:u3:jk:Fr:aW:eC:oJ:yc:oS:ty:l2:7G:Jx:ZJ:v3:l3:DT:cI:VX:3i:n6:Ex:7C:G5:aH:T4:iy:V3:wm:IG:uK:2C:ZQ:kA:O3:D3:1A:8y:oM:55:nT:XO:nd:kl:eI:KB:c4:Vs:zc:d5:p1:3b:5q:uO:oR:fQ:Rf:ZZ:Li:N5:Gz:4E:wH:8c:sp:eW:Np:WC:xU:Fs:4k:az:s7:Ca:gV:Sd:By:Jp:yF:v0:q6:IC:Vy:Fp:th:4h:qz:zg:3F:P1:FH:2Z:kY:4X:ae:9k:8o:uQ:8G:l6:uD:nw:Ih:Ks:T8:nB:Pz:id:vm:s9:q7:gt:07:zF:kP:1n:bR:fz:If:MV:bn:W0:Nx:2t:ws:MS:5x:wt:Z5:il:Pq:6G:PA:f0:4Q:mj:tN:R9:Xz:yH:Na:1Y:3y:LT:7i:wU:U9:Bx:so:Ky:v1:lK:3y:dq:qo:we:T9:pw:gC:Du:Iy:il:ET:69:8C:fT:Ho:sb:s5:nU:Ky:fk:6a:X7:OQ:iz:z8:hw:UD:OT:Ch:Vp:u0:W1:3M:N5:6p:Sr:KW:hb:JG:h3:KD:0i:aM:7A:C3:04:X4:MF:RK:FD:gu:5B:UY:QJ:t4:6A:pa:gB:kf:sC:Ru:Jk:an:Mp:0j:lJ:sE:L0:RK:KK:mi:6g:7F:9K:QY:p5:1U:La:CW:0o:fp:w6:aU:Eu:n2:eB:wH:EU:pK:lq:hR:Ng:mA:cf:GT:gT:qd:tQ:UZ:h9:kL:TS:Fd:oo:qk:C3:jV:6A:90:Dt:gD:ub:kH:kk:f5:FT:qF:L6:79:WI:7X:md:kX:5O:MN:8Z:Jx:0Y:XZ:4I:o3:Hq:ld:6f:84:qR:Sy:RA:Vt:Vy:hm:PZ:hW:Qo:ej:0l:MZ:0Y:LK:Iq:h8:dG:wm:OJ:lB:vc:sJ:F8:sC:T5:D5:op:Ga:Pi:lT:e7:8C:WN:Em:qG:Xe:je:Rb:7u:P2:A0:aJ:T3:Wj:Sa:jg:0r:2N:SP:A7:oF:hD:nY:ae:2H:AU:9M:qx:Ay:mp:FO:D4:d8:oy:RW:Pt:Ei:TD:UN:hP:kw:0Y:ms:Ok:dn:UI:De:Hi:5D:iC:aW:cN:Uv:L5:y5:WI:9v:jm:Oe:Qx:Eu:8z:aW:VX:uz:Ni:x8:Ag:A7:Mr:Ym:8w:6S:g2:hf:Je:l1:yW:RC:2D:wZ:Be:AG:AT:rM:n4:Qj:LC:P0:Tj:FV:6V:E7:k8:Pb:iP:gM:nl:7s:dX:qi:gh:Qa:4X:C5:7D:Sg:R3:xS:Xj:z8:uA:Uv:Jo:8b:O7:1b:5N:w4:zC:F8:UM:aB:6t:1O:Dm:m6:oF:Xc:Ab:i4:ih:AP:gE:MR:Zt:Il:M5:j1:2V:3t:cq:Y4:kC:vb:5x:qM:3d:Vh:Ls:p1:YV:7h:37:k0:T2:e3:zh:4y:5y:ow:XI:0N:03:ZR:j2:N0:o8:dy:pK:7e:j2:i1:he:jx:ZO:YG:OR:q2:nc:va:To:WC:QJ:1h:RN:et:If:Dd:q5:DJ:8n:WO:8Z:Vq:L4:Qm:v8:bA:Zp:I1:vC:3O:gm:HE:Wl:7V:Hq:lz:h1:Pm:bh:hH:aK:Wz:Zm:iZ:pC:9N:nT:wy:1r:rf:rY:Lg:nB:6G:NP:5E:Kx:vI:9F:HW:tL:qQ:bc:fY:br:Jg:zc:9I:zf:h2:n3:sw:1F:YS:vo:lw:PX:jt:2J:si:OU:bc:gm:Wr:jw:Yk:sX:Lm:IV:10:f6:PG:R4:Rk:8x:Yr:JP:pe:uB:uo:Ms:ME:6Z:SK:Yz:3r:jV:y9:zX:8Z:U2:Sn:TO:Zo:xS:6F:PA:Qf:PK:eb:bg:XD:Rq:Fm:vy:oD:BX:J9:sX:MS:Ok:VA:8h:Gq:Ft:zF:a0:kQ:c8:qV:54:dx:iR:O6:rs:oX:kv:iP:er:gZ:sO:a7:zv:yP:3y:Sw:ky:69:dT:hw:Z6:YJ:0Z:DJ:jM:8G:zd:DA:co:R2:RB:kW:oB:RQ:wq:J2:dq:3O:fG:2O:Ub:Mm:Mn:ia:7u:9O:rc:z7:4i:OI:RW:ws:Ph:vY:5L:72:qW:55:6T:T1:YY:AC:Vl:a3:hq:IE:Qz:2X:FB:24:rm:Bk:bZ:1m:dX:aD:9D:Hb:uH:Y1:VK:mm:P6:hl:Gn:L9:0Z:4Y:kx:f1:C8:Gg:LB:RX:rh:6O:u6:Kz:DT:tM:41:YP:zr:5L:hz:Vz:5e:Zw:tL:jH:22:PE:43:RO:bq:tJ:U8:0l:kx:oy:RV:Kf:SD:EW:TV:ng:66:6Y:rW:D2:3q:Zy:tc:hc:21:IE:TW:SQ:F2:xN:Ty:MN:YQ:jR:wz:xD:nw:Wg:u0:vq:UE:fL:ES:u9:6L:0l:Yo:FR:cD:OW:1H:cD:t5:KQ:f5:VI:mU:jj:Sj:NJ:Wd:2p:8t:B9:Ml:ym:0D:hE:Wa:65:ss:eW:SP:gc:eM:Er:Jn:ew:ey:wg:9L:vm:bh:zQ:7I:8a:gp:v8:C9:my:cs:ii:MD:CV:kt:BW:HB:z8:Dp:2Q:fj:3M:eq:Ie:LI:9g:qY:r2:Nm:YS:qH:h9:xG:tC:ab:gw:LE:cB:V7:ct:IW:vL:Td:KP:Wo:O7:5L:51:er:1t:AS:Ph:Al:Sf:JK:I2:AR:hp:V3:HJ:Oa:pq:vL:Qz:8K:NA:G6:H6:Ey:gl:rC:Zt:Ur:VM:Ua:6A:AI:Ak:my:xY:mO:KW:ee:qZ:Lk:kH:ss:si:p5:Ek:rB:kt:KW:4q:85:Wn:hH:6y:cl:sk:mI:j2:M1:33:JF:cw:2d:cF:zV:GR:9y:RS:ku:oz:9l:Wg:j0:vg:0z:Lf:MI:nT:yg:Vi:RP:hD:5v:4P:eb:fX:hm:c2:4O:kE:zo:CZ:js:wh:uL:YF:uZ:JT:dt:4N:IA:us:je:FG:fg:kw:AR:jj:ag:2p:Yv:g8:Dn:to:Hf:va:Hq:P0:H0:wq:tA:6n:Yu:kL:X9:Yf:wG:FV:1C:Rw:Og:3o:BN:vi:iO:lm:Wb:yw:pS:06:yW:Ea:Ts:mD:JF:eH:Gv:rm:hT:p5:17:x3:TW:Qk:R5:tX:md:qI:gr:eZ:Z4:Qc:BW:ce:7q:VP:bY:zM:xf:jK:YS:6P:zY:v9:ts:rK:bw:Sl:vK:K4:fW:VW:Da:OS:4N:KS:7J:as:L7:NN:v2:kX:4U:B8:6K:N0:vR:j3:Io:6S:id:d1:wp:AY:Pi:5u:10:cp:e4:5Q:JU:Lm:BA:vh:WP:lo:zK:SN:K4:yq:fL:0K:rB:Ne:Qx:lu:1Q:2y:Bs:KK:e9:FJ:LN:gI:f5:CD:dS:MI:PS:sJ:Yb:KD:XR:Qc:t8:CZ:1b:U0:k8:hz:Q3:a7:LB:Px:hS:xq:ke:go:ej:ir:ps:4B:vy:di:8L:9A:YJ:w0:cx:55:8m:ty:vL:Y8:6x:Hs:BA:r4:nP:MX:eF:WG:sO:7A:WP:XG:N0:L9:hH:7c:kr:iF:AJ:aT:V4:oO:0B:cA:j3:zT:NO:hj:V2:ky:Jk:O6:Ro:Pe:f7:G9:9N:5q:fe:Lg:Ni:MK:a3:Dp:fL:Xn:gl:qa:7q:0I:em:tQ:Dl:OQ:fM:UF:eY:99:QI:CV:R2:vi:K8:0k:FP:6i:Ij:Yb:Bl:t0:ro:sA:ln:ha:Qp:7q:Yx:mJ:zM:Ti:Oe:Ol:HP:Rb:WT:lq:D2:gJ:7h:hp:Ym:Z6:RO:gK:SI:Ud:fi:Cr:Nh:Aw:UQ:BE:TU:1D:2J:AR:2o:jS:S8:LB:mt:me:7e:KL:6q:Zy:2D:7m:U4:KC:6P:az:sa:p0:ah:Zd:9j:vr:sz:ke:vE:Wy:T4:Pc:1G:SF:Ol:QH:bl:sJ:nS:N4:3l:FC:AR:rX:k6:SC:go:26:Ac:Xr:dW:V1:By:v1:6n:HU:jT:0v:H1:D3:y4:6w:io:AH:uM:nv:FZ:Fg:PK:Pr:VZ:J7:9X:Hk:ss:Ue:sy:cX:j7:vN:G5:K2:Ss:LH:6V:ew:Df:VO:ed:FU:3l:io:wE:5g:CK:ua:Tf:sk:Al:Ts:9H:XA:Oj:f5:02:rO:bs:Fk:GD:DL:ny:AE:vO:lu:XZ:W3:Pw:oz:sW:dp:Ny:Ag:q9:HA:Vv:E7:Dk:ud:K6:WV:VP:AN:kv:C8:S6:pJ:3M:UZ:oi:de:KT:sB:CA:nF:P4:LH:UR:bC:EP:0U:L8:3Q:Iz:ej:mN:EL:xF:NJ:o7:dJ:sH:Z7:Ke:j0:wy:ay:zO:kO:q2:JY:JU:4N:VL:69:ie:wM:Cx:hL:75:Wu:fl:Yc:CY:6Y:II:Q8:CY:P5:pU:5W:kO:wo:mK:QQ:VA:GH:a4:4B:XA:7S:DV:u2:m1:sj:HI:Wd:RC:iV:Pw:iN:DM:nc:eX:3L:Hl:Km:qH:Nu:r4:yg:wt:OR:nk:5L:z3:F1:Ih:fE:2M:cR:yQ:qQ:jD:CX:qw:Qc:gZ:zh:DK:RS:xE:x3:AO:dC:Bl:2z:7P:1T:ju:rO:Kc:Xo:LX:ir:rW:Yv:0U:0q:9A:MY:aj:MS:kO:IW:8h:dj:5c:9d:ZL:YC:4f:JE:Bp:It:oM:Kn:MZ:q8:18:Jk:7S:vc:0F:YG:Lj:TH:tx:P6:jN:Op:m1:7w:nh:eM:0h:oH:KL:ob:y2:1U:Cp:kE:rA:lz:Kk:Ly:5u:uA:T2:vw:Zu:if:R7:I5:dD:yO:uE:TF:xj:rI:t2:08:8p:qj:Ll:TA:3r:bd:Zp:G6:99:xM:Jz:4P:BM:iX:Kh:Rm:Qm:qd:oO:MM:5E:27:zc:UW:Ug:KH:LN:4C:4X:ZL:kD:8E:EM:v7:mD:3s:i0:I2:aJ:Xx:6Z:gw:dl:mY:ZE:Ob:zh:6X:jT:ph:WQ:cd:Ku:wL:Hw:jW:ir:bg:7j:23:c5:9y:nG:LP:K4:Z2:44:x1:Kc:8I:ii:Q1:Wm:Jw:De:8s:kA:Rl:Tm:Q8:ln:uT:Wm:1K:bc:Fp:Rs:3a:it:x4:UT:ym:af:na:r5:j4:w7:2m:DF:TB:9U:aF:rw:lo:ya:gs:vu:Aw:Cm:ZC:uH:s7:gc:5G:Fz:o2:MN:Ft:m6:mU:MF:60:4e:oK:q5:Zy:8K:vK:JC:Wl:Yk:TS:8C:ED:Td:rM:Zc:eW:5w:r1:Q0:A7:Qw:TW:uP:MI:G6:v9:ol:Sa:Kc:zd:x7:Dc:vw:8e:Gb:Vn:IN:Ge:hp:LR:BK:Ez:Gh:9u:DO:qm:aO:4T:cN:y1:qe:0P:ov:0h:QP:4L:UX:8u:mx:mG:YN:x1:4Y:k8:3O:GL:VH:gt:zX:CZ:Sk:ui:8n:mL:W6:v9:Zm:fD:MT:fS:00:jc:IY:sQ:Mz:69:ZB:VQ:Ma:Ki:Yk:P4:Vh:na:fK:vf:Zi:wC:n7:bP:hH:Db:II:QR:Td:Z9:Ld:36:eL:oj:o5:ja:oR:2k:nY:Lw:sa:Tg:NC:2v:zH:Bb:jo:Iq:BU:jB:bB:Zz:xI:B1:nD:vj:sM:g5:0I:J0:wN:Xz:jh:8f:kX:pR:A5:0L:Oi:w5:Ww:uA:8W:MO:1q:N1:wf:te:lZ:q5:Xm:PV:md:vh:OH:Ag:Cv:Kr:zV:Fv:96:FP:EY:Hy:ng:zX:kw:eQ:b1:hJ:b6:ic:wJ:Lf:Pb:5B:fY:2i:oM:Ti:oE:sd:LI:S7:Xz:V4:HW:pQ:7J:s2:OO:Ra:f3:H8:h8:XY:0k:D3:GA:d5:tu:OE:F3:9R:HP:qu:Ru:5k:OB:Sr:ii:vM:6l:Rx:0u:8n:pK:tj:4r:pS:6Y:FJ:sd:Kj:mh:RO:l8:eN:RC:kP:B9:m8:1V:W1:z8:Z2:ix:ad:cp:GI:ng:Ab:UI:qY:KG:W4:u2:uW:ji:V6:fu:qX:PH:Df:5c:X2:84:qG:zC:uw:ac:pJ:8E:15:wC:iS:VL:hi:ez:n4:nK:cm:RS:Ir:52:J0:KM:2x:ii:Fv:xU:7A:VN:uF:mB:xp:iP:tC:U8:5A:LO:tr:7t:74:AS:XO:lS:rt:DQ:bR:Zs:sq:jy:VJ:MI:37:Ow:vJ:kO:Rz:uq:E6:WF:Lm:3y:w8:1d:zG:sV:4F:iI:ql:x4:kW:IO:1X:eC:ZV:X1:MG:az:WC:wM:kS:2z:ji:Is:EM:5k:yP:og:lV:CY:jO:Ua:ul:ke:95:eR:i4:WA:H7:VY:i7:Zf:zb:oP:Pd:Zq:6G:Ia:s6:p0:2m:yh:TK:9w:hf:Ms:M6:sS:lY:8q:VG:Qn:DC:dA:3L:HE:kB:wA:td:Gw:2l:6W:m4:WC:Bp:fp:q2:IL:eH:TG:F6:PE:sA:nO:U1:ME:ct:KQ:zY:9r:rO:lH:bX:AT:Cc:x1:Ji:cm:XJ:oK:cN:2Z:dd:GH:RQ:N3:iE:YG:fW:eE:sS:IR:r1:jD:W0:Jf:US:yH:iT:EA:CT:du:i8:wx:w5:ax:Co:MP:av:Cq:VY:Hm:lm:9y:JE:U6:pt:nH:ij:mW:PJ:yE:ZI:2N:tH:jQ:cE:QO:RX:oy:e7:4P:sX:J5:xu:oH:c0:eT:QL:4g:E4:9Z:P3:nT:Kl:ox:v9:aP:Ji:Bk:UX:cO:2m:UC:5S:Xs:t8:0K:1x:zP:zm:wX:8E:dt:kw:Vm:Wf:XY:Po:gq:e7:5T:j7:zl:wS:JZ:K9:SE:zX:vE:jA:N7:LC:Nm:lB:XY:5q:Ke:il:QJ:5p:89:HL:lL:0u:Pk:Yg:Dj:LG:4w:CF:jh:g9:Ue:IF:6O:nB:K5:FW:md:qX:Hy:bX:SL:Gh:RZ:DC:Ic:0R:6q:5M:Jg:WB:0w:sJ:U7:8J:VV:jW:6D:ax:kN:Wz:9j:vX:9L:MS:H8:vX:kg:sr:PR:EP:jn:pX:Bd:sM:ZL:TD:4i:bX:S8:CP:bj:YO:vU:cO:fY:66:yF:X5:Kv:Gf:NF:dp:CM:mk:tT:wB:LE:re:AQ:io:uA:bY:iQ:HH:Vx:N6:By:P9:Gf:Z0:2D:Ff:nL:XD:mr:Pt:Bh:iD:lq:mf:TI:fE:f2:YU:SA:93:YV:CI:9t:Ka:Pl:nu:P7:XY:Fz:sH:3I:lG:Ih:No:mt:F9:VL:qh:Qr:PI:ZF:u6:8w:fL:wE:4R:BE:xW:7E:HY:zZ:wF:G3:ig:GQ:Bn:Am:k7:Sa:z9:KD:rx:QC:cA:7t:8T:Ux:rL:Bn:uu:HE:D6:2a:ku:yo:mW:LS:hv:QM:sB:ak:S1:s0:5Z:Fe:3C:74:qX:aX:r5:6y:gN:4o:mb:Gi:cp:yX:mv:ok:rP:a0:0b:zB:hi:HX:HA:PQ:i0:e9:HA:F8:ZN:5w:4V:x9:f0:8g:xi:Ec:Zs:uo:ol:lt:O8:uj:Wi:XG:8q:2y:88:3X:yU:46:R4:kP:Yz:hR:aU:VQ:1g:M8:0K:ih:SD:an:vs:rP:1M:S8:Yf:wK:HC:aC:hE:YM:yY:Yu:Wp:Ck:6O:gI:7m:el:8W:WD:ps:4A:Mk:8w:xC:Hb:QR:ze:db:tP:88:8k:ay:ce:Pi:mf:tK:7L:IJ:pj:5a:d3:rx:iK:kf:eO:aB:Ai:Lo:UW:8C:pW:rN:nx:1C:R5:Gk:T1:vc:38:IN:RY:2D:N2:2T:UG:um:As:JU:eh:A5:KI:d2:PP:Kg:5M:E1:SQ:44:be:eO:dJ:hM:2Z:LL:rW:y4:go:6Y:CV:gr:AP:XF:IZ:c4:gD:y6:Wz:HX:eu:eF:vW:ce:6r:2X:zf:gi:M5:0l:dx:0E:Nl:bA:WZ:Oz:6a:Od:Zb:k8:wM:ZP:vf:ce:NG:CP:Fy:PI:Q2:Fb:c0:ul:a8:1U:YA:em:5X:L4:8u:NF:nh:aR:jx:7s:1d: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
3 ص�^��~4�nu��J�;���`�>'��vG5��1LI)��@0�x�?���+n=Ԙ���A������QI�������=+=e�w��Í��4#���u/�����=S]�K���NT�G�����[Dr⁀�����-�W�/��"˝X �e���cCy��Y���Ս�^���5�r�>
⭜��%�c3R� �v�-T��Q�>���a)o>��q K���>�.غ���WR��FY��6G���^�.�XF��B�AQl)�AK�t?����1��{��W,���((A���� �2��~�n���������!�ěe���r�K�ψ<v���꿈% L��U�i�8d���O�R�j6 � U�%E�~v:`Pg WgY�ʻsa�AkOb�p��^����.f3��h���1a�m�g��ZY�FO��0
�)�\1!��nw_��6ŊbӄJ�v��%��j]}�!��q�8��ǡ����b`	���U��yE���v��2���8�{L2d�PU��c��<N��R=1�@ (�46��+H(:Αr��~�b}\I���b���d=�\��F[9�0�)��
�|x�9b�ٙg@�{$�RB>@�Z���ӱ� *^lU���K��>��wXq^����B�
��<�����cdv�:�J�ep���U���:��A"nBJ@n8<yI�������4�) �$�BR@%��@�"dh׏#�&�P�D)U��c0F<���\�4�5;N�O��/��㰂m�H'x�t-�*%����#�´Mw���=�	��F?��|tbp�'���a/��"hO�C1w�ޭsb{;�gt���Ѽ���ȩ�4�=��i
��C/R��{����0�

qog�'X��x$�Z�#�A2lX��� ����b8�Vw ����~i��{�d)n��4{�ƍ�޻\Ɂ�� ��b3l��r��s�m��c!)��]D�&���(n�4�>�N�������F�UfXN��}�xwx��7�)ED����1C�7��Z�V2��%ٍ��M��a(��t���nW:���
�$͔��xI���jXc>D�
@د-�У�� �H�JM3���oڃo)A���Z6�ְ>��u�_9Km7%ixM���$"h��P�Y�h�I�����|OG�F���[ֆ{��$�P�<�s�;��y������0{Mf����N�������&�q���D����(BR�A����S���{Ń`��;$荦%y��w��R���� CΧ��lvw��]�ޢ��f��g��6��]t�{���E%Փ;��FmIs�BR��ѯ���xLe<��1�s����"��VG�6
������l3�UF�zň�TD���܂�;Ŋ���Vd7�&���2N���>�8_ �֍�P�ۇxa�0V��#������V���Z�SW���"q5w#����RRW܎�*;e�.�6ɟ{9�B��n��^�e!�������6����Y,���4AO���z ϺA�9���k���B�*�W�3[+�6�y$�0@�"[�ݣgj�Ĭܠ��Jub��T���q{7�1\@M;ބ�E��wX�;[���yrP�2y��@�ۼ�X�+i��a���enC�� ��(/�G�m���$$x��Ԁ��Zf~^��DU�gM�%�&�2��[�?��s~M� ��@ Sdl�X�m_�x[��w-����b��e�9c!�C���$�I���Y���]>�j�T����%�L뽄�/
�S.��s���<�x�K�j��$��yR8�g�� ��it�}��V�ڀ�
�HB��&�6)`e����{D�z��46�s�F��Iu���
(t�c�<���=�&s?���6�I�t��Ry��Ǘ��iQ��I ��\��w�7f�UTS*�8ڵ�?A�\��T�Nv �T�X�A#k��/�w}�^�
(&����e�6�?���r���z"X0ҨS�67J�n(?�Ts6%�<����f��,�N����8dd���Δ�F�:�t��-m:����"z,n�'|7�ϗD��{�Mvc�����U���m�u�������ᒷ�V����@Z= ����+`�CH�T߻��fd�`��H����er�f����g$��$MLk��N�;A��z��c�Z�UW핅a�c����W4T�`��E8I�V4�Z#�@����(]�ͳ@8���H�����,���_��q�$�O��U��7�
��qF�,A�H ��ќ�^�F�VK�Cj���SM{�1�h��0�[�������p�	H͠� ���js��P�)�P}��jmXZ������VO�,`��|�*�-
�f�qM�m��{�4g̃�L	j2�H#��kNh;��س��"~Mx�Q�e_z=�gAe���](Dj�.�S��xP�g��!������]��{�!�N�Q&��cJQ�%+k�7�HU37ul��݋��
�s{������ɼ�D���th���fE�"���$�P3TB��w�����<c��M\�X~��}��?2�a���1E�~��HCy��ԍ����:�7�|���&�
�}sJ������h�_�g��?���$����:���n9.' �C�����,���U�
�AE苳�g�L��7�L���r�+��}�b��OV.�������xx��F��ě�H��'͋7���i�W�t6�m��Ah9�������ؓ��)>`�n��	�1�*S��[;���s(�«�20bW	��V=%�;3��WbE��,@Y�R��'"S"L���.��N	价�{�m�z��\م۩�m�k����W[F*�KZ9����}y�sX����^(����
հT�N�G���l㛉��?0ު��v��wfk��;�Х���N��s~^�n�%�^Tw�R,lD�ܮ_V��G[Vç<f���r�PX{g���%�G�g�7�A�k]7,�MvX�|��m�VtjA�|=Q��z�9��R�+QV�����m�j����w-]�S1s����H�����x���gp�0�iv �g��?�C�����`�b����\{WJo�
lDN�.HT��6)|Me�|��a�{�/,b�C�ÆW4��Ռ&u�ƫ�%�}ªb��P�mnW1�Y�b�$5��Z�6�^���8`���SY��F�H
�"y���23k
%�KU�K���ڟ���%��|i�(�^}�u����ù��!���nH�^e��5�|Z�@�G ��W0��m@Ȭ1;��9��r�|��T!W�y1G]����� C!�}.;� ��>�e��߻����/�S����Ek>G�K1"��`z%��L�y�] ���O�OW?x�֐@f�6���rB2�D�	�@���u<{�t��q=WE(�kτ�Qi='��.��H9+�J�6Aɽ/��k�H�ʊ����D�^�� ��b�~k`�$ �8ڻ����l`5%{8�#W����)��p̑�M�����Y�cŧ���Jx"�Yխ�&��i;�C?��+���V�\cg� �������9��Ȑr�c;�St6�ڎ"��(ÝX��!��F��t:���?ma�V|>�m���t0>B�0���_�ߋHJ�L
&{��ٺS� Y``��	
�7))L�R`KŪB]���QS����H��nV�Y��R�矏���g��w�]]���=^:0S7D�~JPZ�m�Y0pB�}������^���yp�CY7p�K�}��ߔ��� ����+j�賢���B0ۙ�V(X���EpӐ�+~s���(��Qt'�Q� @���j�6���`�������㌒�p�ֳ�������Hנ���t�tNN�E�_��b2��T�+'r|%!��
�CQ�!���/
�A�{����pt9�=�\:�6k�%�HG�ç��
L�S�4��o-�/ҡ}#V�db�Jl�����qEA�hĺ��7����-ř֕y�5��"��k�e��v�r�lJ��6E#<+A:$��y^'$�5Ѣb���At1-�|?[U�ΫN.!�PQ
���Vsw�PP�
�y�%ax`^���V�re@@U�hNlk�V����)���#��h����X@9�5���Ís DHv+�Q�;f� �>hP����1�N,��S�Z�P>_��(���(f��b���\'L��P��
��WfZ闬���� ����jxd�F�O��1�?-�"�������Z�0er���Jg�dqI�/>�&L䤜�������?���JG�:�ru�N�&�dӉ�^�J�G&��'�χ��7ˣtP��]�2{u��m�9/bэ*#�(M≨�	�\�d˒$�[�_ڬ9�������RV����k$:U<[%y�sT9>�+�� ߰-G/*���=aB��n�M�]��������'�tA�,�O�Ĭ�� ��S�,�����ZJ�t^i�.0�_��7xK���-ꂙ^�k���m�P*�k�������ckI�2�`���%��{<�w{S����e�U3U�7�޶bRpj<_i
���/��iL��=������U,����������P�Dh�pO�w�͋��fcJ��h(�4��c���A�KN��Z��S��
�3�0;%�:Y����j�	1��E���4�ȱ�0�Ѵ��˅��ڱ>�I��wL�j] T�O l��_l;���,|����={��2����H@��:�7b!�J��\ٯl������އ*~AK.��IE�I�cJ bxna3��k�KⲸ�AH�&r�:�*T ��-Z����D���!2W���0$*�&�ylg�b��RF������q�I����L�E���)���erb��i;.ʰ�3���LcZ�I/`�]⺺�Y��@߾��D�%�N24����f�����0���8�Ŝ��;�,�r0\����%m�HU� ���>n'�@���L�/�uk!4[�rQ<U�8 ����������G�6�q٢��f�qh���˔(8��i� �31=#d�%X2N���zw��E��l��a���
aH��|�-`O!�m���x�^�}�n~��H���*Q������<|�p%���������Jܑ�1�lF }��3$R������
��P�T0�r>ҷ�Ċ�0A3���=8[6wUw���xB�a�@�8/ל�w+gf�["׶dYt������v���="�҂ܚ5�q�S�R]Fh
������{�z��rk�z��������o�0�7�N4�NL$��w�b��叱"OP3n}�'O;��c��%Y�HF�BmyG2$�᱊����>�`�+�c�ް�
���#�����;��4���Zu���R���є.�K�zM�=�m1����C��9���k�����\!�\s���z�O>��W�iSB�J���e���BDS���:�b�26�?[Y�JM�8�P��PN�/���O$Æ$qm�Cl �o�����~��h_��t��j��Wc�g��F����ϡ�k����']��>��qR��X��.�� ��O��d�c������_��B���`&_EM��%�QO��r����ݻ˕�C�D��[+	5BAE_��F��|q�p��āG�B�3�hC�,�P���(�@`{{u��L�&�4W�;Zt=�ґdÙTWՅ+5�g,~c�Flj�_��O��6�J
";���+�c%!�4���n\RJ6�5���ۖ��jO9��Y��?�1=��̒6k�ڰ̀�c�2	��W�{t����sp5؝�w�D����!�<�L��zH82�r����uĞ����V��l-\����v�.~1�B]����w�=��B���FVO)���w(�HF:��p����&G&&���e���$&}��V�:��ߗ� �����/[EM�.2�,�E6Ġ�o��d��6B��h��}:����Y�	֘�z�	+M�"� 
/��9� �}��1���>P���@yo�_��
n�����G�]���R��#;{�����������4g´7�6�PR��V�mU� D�2�j���i-�
�V�Α��7X��*ڇ�1���Ɉ*�ݙ/�M�� � ݙnj�����f#"������f)5TC =�|kZ�8� uދ�]��z7�tNЮ����qR8���6;�^�e!!�M�ŉЕR���¾��ֺU����$(�_���2ܳ�����t�w�?[՝�d�<q��jn6��%\.�����8�=^�
됾m��BH�8/��$�E~x+`�(^���b@RT-H�0-Ul,fP-k8����o;�$�.ez�x᫚֨��!J�a��Ԅ�K��8i�/�h���~x��mR%5���΃|HS���`�cC�=G�¡�?ܞ��@�,o�3�M�<�y߉��	��4��|q��5���_��?�y�ݗ�'녥���-�%M��s�y����2��aе�|D�