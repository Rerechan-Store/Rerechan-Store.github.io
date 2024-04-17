#!/bin/bash
#
# This file encrypted at Wed Apr 17 11:16:23 AM WIB 2024 by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | g9:Le:GP:eb:wV:Sl:1J:Km:wo:2C:X6:Zc:y4:Si:FJ:q0:Xp:pF:4L:0a:96:UB:XG:Wj:d8:2e:Yl:Iz:qW:9Y:Fn:IU:OU:Eq:xf:9S:ws:ry:Gq:hI:wk:M3:MZ:7c:gj:SZ:e9:e8:LW:Tc:kp:tc:LA:Qp:GK:Um:5V:5W:Kw:i0:Um:oP:G2:59:Pg:Vh:f0:Az:0r:QA:tK:Aq:1K:XH:dn:EW:wf:kK:o5:al:6d:om:Ys:YY:Nu:qA:uN:Gt:2n:TW:OA:fu:n8:Sh:KO:hR:US:tE:EY:Ge:wL:qS:iZ:TM:da:fJ:Fy:oA:pX:vF:MX:Zw:Y2:uK:vF:Yh:2S:m3:Wr:yW:GG:gR:zh:kR:2M:Ya:EO:Y6:oZ:Ee:J1:Yz:pE:yl:m3:p7:aP:nT:MP:gK:Q2:3V:ix:7z:zJ:bC:DG:g5:kY:kV:5Q:OL:9X:iL:sD:iR:2O:12:PG:Jb:up:oy:S0:wN:89:fP:x2:1v:TJ:ek:Hy:cD:y9:Jz:gA:15:kU:d7:gb:9D:OO:Jw:ES:KX:RQ:7C:SO:4Z:Cj:eg:bh:ti:3u:Fw:aA:lD:T5:Eh:6a:J6:xQ:v8:f3:D1:Us:6R:oS:Q5:Dj:59:qz:Ue:68:2q:M6:co:3E:Y7:bN:C0:Ct:Nj:a0:4P:xJ:t3:bg:Xp:6O:Kl:nU:p7:Gc:rN:qk:0F:qv:R3:Ie:41:ya:ga:60:ON:0j:t3:QR:Zq:w5:k5:ph:4C:Vx:l0:j7:9P:wj:Ju:RB:Ih:Hd:uP:fN:iP:fG:x1:Q8:2u:zV:e3:x0:bd:xk:fy:oh:Qm:t4:Fh:sn:3x:EK:nd:7i:cS:45:w8:VT:b5:Kj:bk:d2:Js:O5:on:qB:7I:R9:nL:ec:iT:46:bb:mD:FV:kk:2W:P9:eZ:aD:0X:QI:Uv:ye:hZ:ig:Qi:b5:rg:zi:jW:8E:HM:ph:Z5:YJ:gG:rZ:SM:An:8L:fU:pz:3t:xJ:2f:ow:tY:vf:cY:T4:Q4:dD:UG:is:U1:15:8l:9l:0s:0Y:Vy:yQ:ix:Ju:fJ:za:ie:6e:GM:Yy:lr:VT:2M:re:HU:F6:xC:n6:Ki:z4:q6:4Q:Ci:g6:df:9j:LI:sZ:ZI:TD:Nl:JZ:jk:LS:74:jR:Gl:MO:xe:Hb:Aj:0o:nQ:ZM:gu:IX:ES:kq:8F:m3:mj:t6:cQ:Vp:wG:Fz:CC:GQ:Oz:4c:6O:3q:UU:e6:yE:mx:0a:r0:9w:iN:s8:T6:nm:7c:Fl:sJ:Yb:7g:Ct:RB:lr:IM:2e:ZV:Im:wU:08:K0:Lw:39:fX:Yy:zL:jk:Vw:Jq:DZ:9u:tj:hL:p9:D1:Bw:BT:pm:iG:HE:3f:Kw:OF:pC:mL:Cj:CJ:2T:fg:uF:9Q:vq:pe:vJ:pR:On:UL:t3:QV:7q:Tk:jO:8t:2g:gG:8W:79:h4:kv:F7:jO:vm:F3:k4:ch:5X:dH:Ss:9b:Zt:2Z:Ke:YL:pi:Vv:qk:7n:oj:Rj:y0:C3:xd:7c:Mm:KC:2V:3x:8k:Ja:Zr:fi:aH:DV:yT:8B:2I:EZ:sI:Pj:Uc:xZ:V5:R3:NN:ge:Xr:e5:7K:dh:TF:uw:GU:7h:fB:au:Ta:31:cT:Uv:21:DS:C4:7X:ZK:24:Ya:Ii:C0:3h:XD:HT:xB:co:Jt:vO:gk:3c:Qy:ev:u1:ZG:qf:Vi:js:oq:Yx:Kt:ih:Nd:Ws:KJ:dC:cK:FU:lx:tX:3m:ch:17:yt:9n:oF:wI:AP:MT:Hl:jX:0D:tL:U4:Cz:hh:e0:jE:bV:Mx:Q6:JG:ha:VW:eP:Io:K1:2a:WR:oI:GY:1s:Il:iz:2M:X4:6Z:NO:Bw:0B:fd:ah:Gz:Fb:hP:3z:4j:ql:29:oo:Dd:vq:Vj:pM:c1:Nq:Vp:Ys:TI:vA:p0:xr:PC:mI:Xg:5i:RJ:wr:Vg:w8:Uj:we:Jk:3p:BB:sz:yo:Up:Sn:1Y:0o:PQ:cn:dk:2A:D0:hr:nk:DR:TN:GJ:QO:Bm:J9:oC:zh:dy:F2:98:e7:y0:yd:2w:tM:Xi:Ov:Qa:Lw:54:ZS:aS:L2:dg:be:So:Vp:7C:ZB:zU:SE:pQ:IF:Sp:Qk:CW:Sv:w6:Jr:ar:P6:57:b2:B1:v2:nu:cV:52:cv:oj:sI:Y5:6q:A3:KJ:cx:L3:Rc:R6:Vi:EG:sb:7l:gr:nl:Kt:UU:4U:nf:pt:FV:Zd:Zh:fL:eH:vj:Fe:0p:1r:Ca:bl:jX:gH:7j:Ll:tK:cC:1T:Ll:9U:sX:SK:je:Sr:Ki:ud:FK:p7:rx:c5:ac:e1:y9:62:1F:cV:I6:iU:ao:E8:dh:bM:Fe:zc:rL:2H:0F:tn:co:El:N2:Om:fS:Sn:DD:0N:Ji:Qt:PV:YV:8m:MU:UV:2k:13:UH:zV:Dl:XS:j4:oj:yi:49:L2:xS:C7:Ie:sO:AG:DR:mG:P9:Iy:aJ:jV:Qc:4W:1t:19:HC:Om:Uh:UC:w2:mb:hQ:7P:sh:HI:oD:XW:Pn:0P:0P:SX:DY:VL:Zc:7m:SG:pU:r2:yV:gG:kX:9x:hD:RH:xV:LO:k7:i6:Z3:9Y:5A:Be:Ls:sp:dz:eb:B5:gW:CA:B6:qX:PE:uv:wz:pZ:Kh:rq:OR:fl:RQ:21:D5:9X:Bv:wt:UN:92:uP:AL:v8:t8:ZR:gh:1q:t4:lz:3k:A7:Ig:fM:81:fk:rB:1K:bN:Ct:CW:Wk:oW:Z3:00:gq:px:ol:Qq:fa:WE:XW:Kb:Jm:yp:FC:HU:7W:iH:90:xu:mg:xr:Uq:MQ:lP:aS:sR:uI:63:fv:c7:0N:hk:NK:AV:PP:F2:3F:AF:yW:ei:XA:9m:8D:DW:jA:eo:nk:4U:DU:ol:Mk:I7:fc:Am:qT:qS:Gs:li:Mr:eJ:v0:Sa:kG:HT:lL:x2:sL:UE:H1:GS:XG:4c:dY:gb:xu:dv:yp:Mw:P3:1w:0v:eo:0a:tA:FO:eY:4T:yt:kw:4t:Jg:5V:Uw:mY:XE:Pw:cI:HV:pH:bW:t1:cT:rn:0o:lJ:lE:Hr:Zq:CK:si:cm:ow:ad:Tw:us:BJ:4H:u2:7h:br:V0:Qw:Be:DE:Do:RQ:pj:I6:ZT:Wc:Cg:ee:AD:o2:Au:V2:Eh:1U:QR:eC:ZF:h1:87:Jq:5a:Sz:qL:vS:it:Of:Yn:TD:tC:Sm:9N:4E:5z:Th:fm:aT:eT:1j:KN:uR:Jl:5Q:33:A9:r1:cY:AL:C3:56:P3:ZA:ef:7B:A0:7E:LB:Wg:ly:fg:KV:af:oS:xe:oN:eH:jU:pY:qw:fN:8I:jy:3Q:RP:Xq:UP:Vo:MW:H0:Y4:s5:gw:YO:HG:0I:kl:U4:pG:Fu:o8:1G:hs:Kx:uV:CN:B5:Sf:Jd:n4:cY:O6:Fi:FQ:M4:A7:np:Th:qL:Bo:ZW:H1:TK:Om:aP:ha:1E:iK:Yv:Cn:zo:St:YG:j6:Ie:IW:em:Zo:Cv:Bz:cY:om:UW:of:mB:SH:y4:21:6p:8Z:eK:nl:Ms:tz:7X:n8:5Z:M2:SP:Pi:Rz:J0:SA:rI:Az:4J:CW:aA:L6:rB:K1:Zu:Xi:oF:c7:u9:cD:Ce:o9:q7:i7:XR:an:yj:Af:BJ:uR:ik:aD:Zi:ME:zj:eK:4r:C0:Pg:BJ:ET:xS:At:4l:Vc:hx:lm:hV:iA:NM:BR:1f:zU:LP:fN:Je:lx:a4:3r:NB:OP:O7:RQ:KC:JA:Jq:3l:6O:Tp:oQ:ok:9T:8v:Ay:3b:a9:Cj:C5:IA:0a:VY:Wt:aL:ct:0h:nj:FO:fr:GG:hg:w6:Md:tQ:bx:Wq:JZ:zD:Uq:0t:25:mM:BZ:ZK:ID:Hr:LU:4P:pa:c0:sS:zF:6Y:WF:uD:xH:NI:xC:y0:Pj:Q2:9h:tu:kZ:Jt:RF:8r:vA:ci:S4:Q5:Rl:Ki:s4:gQ:Us:Ko:Zb:Q6:Ak:F0:ER:4G:Uu:xA:ZQ:Hu:C3:Zj:Ae:kj:P5:lk:a3:ek:I6:il:Zv:lj:cX:3E:eb:tE:KQ:jQ:OV:9Q:vH:OQ:Wp:i3:0z:Qe:D9:UG:6q:WP:oC:dW:11:YM:sC:gh:MN:4A:bs:Dv:SW:Kh:f4:2s:VI:4s:N7:sK:Ls:gC:Mq:Kd:Lh:ay:zz:PK:Y2:rz:9h:E7:yI:M0:5o:ka:op:J5:cF:F7:UD:PG:dx:Ou:DI:tz:w2:ms:UL:6L:RB:cN:mS:xc:MO:TX:p3:yC:mv:Bf:nf:aK:Di:bH:i0:Rq:u6:Vk:Ah:bI:BM:ER:Kr:kZ:K0:au:ww:Da:iP:wC:mR:ST:79:si:rO:62:yW:mf:LI:jN:3v:tI:N2:qA:Dj:6w:qf:1y:7N:qu:6i:X3:8I:Zh:gj:Jl:fL:In:cu:Z2:LH:oS:lI:n6:W3:Ne:8T:Ue:4s:LE:LC:B9:o2:Il:UT:4T:AZ:pj:r2:aO:b6:pO:8O:nS:Vi:ID:qc:2U:bu:79:74:v6:4F:MH:XZ:4z:JM:KG:aJ:ZH:KU:i3:Gx:us:cx:sw:Oj:5b:O1:FM:YD:AP:5n:89:HG:wi:og:27:k9:fo:Hv:vY:Rq:K8:1Z:7Z:sL:t6:83:aZ:5K:yR:fk:TC:xF:6d:IS:lj:cS:Rh:5j:9R:S4:Uy:Va:Jr:fc:W6:t7:ya:eh:Oy:vE:eM:CZ:K9:6E:4j:Sx:IK:X3:Hu:dh:d3:rR:ZX:90:18:Xq:G2:IP:5s:0I:dt:O3:od:29:gq:Ln:OT:u7:SL:s8:pr:O9:EA:21:qY:dw:4j:NQ:lS:Ok:nt:gv:tG:CV:a6:7w:xt:qZ:KC:ta:Tg:Qb:bq:Tb:px:P4:vK:xs:rP:8t:aw:NE:c0:4c:IH:dE:fN:iT:62:QX:N4:zM:gx:3c:N0:CB:6c:Ip:HI:jf:op:k0:uU:cZ:7X:3G:50:Fn:zE:mh:DL:dj:Ah:g9:UK:Wf:hU:Hg:Ug:Kc:9Q:Ow:9U:yV:x4:iL:qZ:OB:Dm:VJ:5o:0Y:Vx:ud:Wb:bC:gk:gU:5f:sJ:ZU:ZL:3b:3d:wW:51:qa:34:oZ:WB:Yj:G7:XX:xJ:Ko:Az:zu:R2:xh:q0:U5:zA:zI:PG:Yd:iV:yI:Pb:3s:si:LD:A1:Fz:Di:yJ:rP:pq:MJ:Ys:9L:dx:Jd:ut:fp:Md:Tl:4b:QN:Kq:Ni:Wr:Pz:NZ:Gj:3H:Pf:56:3G:eU:UO:gp:qo:1X:i3:Dd:5W:YU:z9:OL:eZ:N0:A7:pV:9B:p1:Zs:dc:yg:Mk:dd:3k:76:l2:yf:1a:ub:bW:Gz:oG:Z8:Xj:Ki:gK:lG:zA:d1:2F:FR:c3:lx:EK:kE:OB:Yh:4Q:o7:By:dP:ns:hQ:Eb:MH:bn:cu:WC:bU:Bw:tz:gg:99:j7:cJ:TQ:vF:gl:Ot:WI:4D:PQ:yj:tu:ck:0p:Ek:pD:Wg:gJ:G2:2K:j4:vD:qd:Zl:1q:ks:aK:G3:8r:x0:ls:Ov:rg:6c:oo:Fo:UR:9X:f1:iB:73:Wz:vk:6U:Pc:gd:Mo:Dh:51:P5:yR:6L:oe:eU:8f:P5:YS:rl:nr:sM:gY:BZ:3l:6N:YI:6E:IA:4R:jx:01:0v:32:v8:0y:94:rh:fS:cg:ZI:Z3:7q:dm:NU:WF:BJ:rm:9r:Vz:N1:ft:Iy:ko:Il:hx:1f:zR:mG:y1:AC:G5:lZ:fM:wM:mk:x7:Zm:0t:Xf:CK:Zo:yt:vN:up:Ne:gK:8l:4y:s3:69:qq:NB:ht:Ki:r0:mQ:kh:EM:AF:GE:Jd:di:rO:79:nl:sl:TD:ze:sN:bH:r6:7w:4p:cZ:lb:4J:N5:sY:t5:1u:Dx:KC:5v:cT:k5:cQ:PE:vv:3T:G9:UZ:2P:NR:W6:M8:ms:3W:Ya:XZ:aM:Ec:my:w9:vr:P6:r7:VT:kv:sH:hV:rA:6n:vw:AM:9B:fe:Xn:5c:MK:JW:jE:vv:sD:xL:ZW:yG:KK:SK:9K:Ch:4S:Zb:RT:SK:HE:SN:3f:YK:YH:BZ:yE:Tt:ol:l1:Md:HV:WD:kA:Uc:T8:4g:sg:9w:bw:xG:MW:Cm:Sl:Mq:Fi:XZ:0k:Um:rR:pg:Vf:qX:5z:Tv:yF:Ey:FP:QC:dJ:m9:5J:GX:gs:2i:7Z:zU:PQ:4J:Xq:nq:ry:cq:mR:Q8:4h:nb:Zb:Q2:1o:KE:Cc:2W:La:N7:bj:dO:ID:uL:CK:No:8H:BJ:Nl:3e:JT:rd:fI:MQ:xt:Vj:Tm:KJ:4u:XN:iu:Kx:Bj:L7:pC:Mi:df:VG:Fj:b6:rV:Do:qb:07:C9:cI:Pb:CJ:Tv:3U:li:ga:c0:PB:2Q:qN:Jr:iM:YN:0d:ef:nE:PQ:Is:rP:dY:gE:bS:Sr:yJ:Pv:Nz:Gh:W2:9O:tG:ve:XY:cl:Go:8L:q5:af:lW:A1:g2:aP:aZ:Ij:zy:mY:qD:te:bv:VI:0o:ev:Qo:4K:P2:qI:8D:Lr:gg:G7:1y:QN:Sq:6s:kS:wb:Wc:b7:qf:oc:g5:1r:B6:np:ug:GR:UL:D5:6u:Gl:VZ:Rg:Gb:IG:9o:Jg:8D:4R:lz:xG:Vb:1s:9a:Vq:ye:qI:zI:0Z:71:0o:Wg:MY:y1:U5:1O:h1:5M:TD:k4:hV:Yf:dB:BD:Hq:il:y7:1C:aT:XM:IM:oT:vg:rK:j0:RQ:FF:Q0:sZ:fY:up:j6:lv:5H:tm:y0:ph:Ey:DF:C9:eN:yZ:xE:zS:Tk:Gx:PT:V6:lp:vs:3R:sN:iN:s8:Il:lR:fo:gb:Yg:0F:1n:bi:nJ:PI:Yx:8z:Dr:1M:ir:q8:LQ:LA:Xn:5C:ov:43:YJ:dK:D6:3w:qL:dP:JL:PN:YL:zV:8Y:Gm:PG:rk:uF:mB:Ha:p4:Pk:YA:8o:ut:jn:A8:IE:ha:UQ:cR:q0:DP:zc:as:Er:1w:9x:wb:ON:HB:A7:e9:wK:dY:XZ:VV:jq:WC:fj:DJ:It:MY:gH:tB:VJ:kh:0C:uw:wB:xJ:qd:ry:oF:D3:t2:UL:m7:3k:wf:33:mX:1w:Ya:M4:wH:CM:Oo:F8:Ru:vg:Uy:xl:ET:3P:Oz:CC:8V:pG:f9:Dh:hi:tf:du:gc:px:Ai:OO:PI:sF:Bl:5C:Gh:nf:Xp:zd:mB:tg:EO:5d:jH:ep:MH:D6:wb:2D:k8:NR:TM:gD:Ry:1v:Yw:KT:yU:BB:FP:92:UZ:Kl:lJ:Ud:Ci:vq:Zu:Tz:GS:dx:IU:ZS:qS:8j:gq:Id:bC:Jk:ye:Bm:q0:pQ:OV:K6:YZ:hu:dY:X3:FF:nj:5N:vV:sY:sj:Uq:8d:Q3:k5:wt:HK:Jw:e5:gC:PO:AE:Qb:7r:9z:xu:Nd:Av:Cl:gM:Rl:wa:eF:VV:o9:IK:pN:VF:MF:EY:fN:8l:Fj:Tk:Uy:Wo:vv:Ym:5R:9p:Cb:HL:K7:RH:oH:yB:fL:iA:qW:G1:CW:JH:qM:25:UK:9c:uf:BB:68:kC:B0:1O:zv:pk:Yz:EZ:9n:dB:6a:PG:f4:RN:Vi:XY:8I:U8:fu:XK:kl:qP:PI:6e:rI:9Z:X8:Wm:qm:qv:mD:ID:Cv:mL:t5:3u:tC:pJ:Jz:bE:BT:V6:XQ:E9:lm:AO:iD:zu:Ax:NS:ba:kF:4e:SZ:hf:pY:S7:6n:Fu:Fz:Ye:17:gP:Jz:3M:Rv:0t:o0:dx:tl:Zs:OM:5r:qI:SE:nl:GX:Ya:nG:dv:ZE:r1:kc:d5:AK:vy:a2:Kd:9E:u2:q4:7s:W7:Yp:Pd:ms:tS:JX:pQ:Us:aH:2X:1V:UQ:v5:9d:NT:bv:sJ:HU:FK:IA:2O:2V:19:Ao:4K:nz:0V:mW:Zm:4t:Wn:9u:gr:6g:KM:x4:aX:I2:aZ:Ty:ZR:ZJ:ag:8e:5B:k2:It:3g:Fb:Sz:CI:Ee:SL:HH:U4:V1:Xv:xV:MB:Ao:Nt:oU:Mu:f6:rX:bS:ZR:Ko:FB:Hj:yL:IO:qs:Xg:9Y:Yx:xE:At:nG:DX:e9:jF:CW:mG:Nl:5f:Ni:OH:k7:SA:O1:j5:Nu:6A:mQ:P4:T2:eH:90:CK:TO:GO:WT:U4:jI:H0:Tu:B9:j0:F9:Nh:jN:Ka:q9:RV:Bn:tZ:DS:4v:ys:VE:RV:5J:2t:5n:Wh:oS:F4:20:l5:SI:JS:Pk:Zg:kH:ei:Io:gC:57:yQ:uJ:HY:U1:vA:N1:Wn:7k:Qf:Q7:iy:hg:NZ:dG:sx:HN:BR:NR:H2:yS:2l:oQ:KV:hz:iq:0A:Sf:9F:Ul:Mi:jA:Qx:xK:Nf:36:n6:NP:2f:2F:pF:Yd:fE:ow:MB:ef:x1:UW:nq:0c:BA:UO:VK:HJ:r2:xi:gA:1X:SB:Fk:07:w4:nm:5D:LZ:bE:DB:fl:Bo:2D:J8:ba:8Z:BH:M1:Vl:GK:Ee:TX:Hb:Xc:tU:46:cb:Nb:RA:2b:8J:bb:c7:Ij:kf:uN:F5:Hl:uR:md:lX:jc:fZ:Xu:Ok:pH:M1:YW:Ja:J0:Fl:BR:cI:gw:xG:lw:zi:3p:X4:vk:mf:bm:8i:IU:co:rr:Uy:9T:f5:7n:CF:kN:pf:l8:bI:yE:hS:es:rP:SM:LW:Sp:5I:ZX:fT:Ml:qx:ag:dY:f6:NU:xV:id:Qo:Rs:X7:Mw:7H:ot:bk:KP:uP:J0:Sf:AN:HS:iS:M7:x1:zg:aG:9w:g0:5l:PD:S1:t7:jX:B0:vD:ba:Qc:0m:Mm:rA:Ib:Oa:4V:Nk:VZ:zg:Oe:ih:lU:cT:hT:Ey:ik:xo:2V:AC:B6:Zy:2r:9T:dp:dE:QJ:WD:OZ:2O:cu:XM:BH:W6:Ff:wN:ID:2H:6E:nn:A3:s4:Wj:md:IA:P1:6r:cp:J1:dE:vy:Fu:V9:Px:yR:HH:Da:oB:fW:Tn:xM:my:1z:sj:lo:m2:4Z:PA:CR:Oi:Pb:dH:wm:9T:tg:Z0:42:bh:a9:Gq:C4:6q:ih:Gb:hc:9s:CB:bI:xF:u4:mH:MC:7f:lU:J0:hK:Z0:cl:B6:e3:FD:gs:14:Ed:46:ll:p1:2P:kL:c1:uc:o3:aM:ji:hw:mS:IZ:J5:7X:cp:6Z:JL:K4:U5:dG:Fa:A4:NQ:cU:qQ:c0:nl:ew:Zt:ur:vJ:aG:WV:N2:l8:h6:U6:aZ:9h:0x:sL:ap:Go:8w:Bu:MS:VM:6k:8I:V1:fc:fd:zT:Zi:SP:BA:QW:rB:3n:3z:VP:Pg:9K:KV:HV:Ok:IW:Bd:yg:Bv:vM:dp:jU:H3:xq:p8:GA:uo:DE:Pv:8W:n6:l1:j8:mo:pF:dH:Si:xc:lA:M5:8v:8i:mn:PG:Hr:ON:0n:1N:4S:nX:sw:sl:5y:sH:NH:9w:FW:Xd:26:KC:nN:Wi:N7:76:s3:B5:RY:23:nd:Aa:9b:h7:2C:or:Sg:rA:wo:el:I8:Ma:eH:6W:VH:A5:1t:2c:R7:gm:jH:oO:ZJ:7C:MM:ze:dg:eb:I5:Wk:wd:HK:7Q:V3:lx:wL:d0:Xl:K5:Hk:VG:08:m0:Ic:ko:dW:Vu:7p:N1:Z4:Rn:r0:BV:Wv:zS:j5:r5:cY:HB:FU:S3:Zp:WN:QS:Rk:oi:8M:74:O6:Z8:oZ:7Q:tW:iE:Mj:Hs:2X:1P:ci:wh:VD:gP:jk:Ho:kb:0I:br:my:c4:wv:rL:v6:u4:FI:VX:iz:UQ:E7:wC:dw:Wz:h1:5b:By:Kn:bn:QN:I7:VJ:mV:bL:up:nj:yi:8q:At:PT:3V:Zr:Gc:Cw:ol:DG:PE:HK:rj:sm:sL:gQ:5k:K1:O9:br:4u:n9:k9:Q7:1Y:3j:Rd:iY:FC:Ud:Ga:Xe:iR:kD:JY:QB:nH:Ip:C7:PX:cR:wk:nX:t7:hR:aS:m7:4X:JU:65:9x:XI:KH:F2:LW:lu:11:p3:As:11:ZQ:V5:zl:Jb:Bu:tc:Bj:AM:q3:eK:Xu:sD:mL:v9:AF:YG:5F:4W:bN:31:Er:dZ:dx:Zh:jj:bu:Bg:Ff:9V:IJ:Ms:FY:zc:hs:Zt:vA:8d:RU:1M:dl:J5:kR:MT:7z:j9:UT:Z6:zE:iH:jR:vb:xJ:rm:uP:Cc:Rn:LE:tY:ig:6w:Ra:IT:Lq:Mx:q8:P5:yZ:TY:ou:7q:oy:aj:mZ:fv:x1:vc:xl:pZ:S0:EE:4R:WP:Et:FQ:gK:HE:La:En:fB:9o:1p:DM:fz:5R:es:OY:ns:oR:Fv:ua:lv:PH:l6:iK:JH:HU:lr:hU:8C:jp:Vl:mL:ZT:Mf:O7:oj:VN:Qb:EG:1C:Cw:3A:fD:MT:Rw:8h:yA:iJ:Z6:xx:n4:cC:8s:Lx:wP:PI:hu:X3:dh:Fx:Lk:NO:gM:Az:TE:Vg:0n:X1:nx:Sm:x7:5a:Wn:Px:Bu:k8:fJ:Ac:ur:dD:CJ:eX:i4:5g:kY:2M:9V:KB:qh:3G:Rk:4K:0R:gN:gg:6R:9q:xA:vE:xe:yf:vP:Pk:Yl:2l:E7:zu:AS:NG:bx:3n:f4:7Q:YS:py:K3:sF:57:hs:4i:d6:fR:RT:Aj:R6:ta:Ju:iC:YZ:89:WI:5M:OU:ET:7O:zt:rb:E5:v9:ux:uj:C8:B4:F2:GB:ZO:xB:50:aK:mW:3x:Ta:JW:x0:vX:Ls:UX:k4:oV:V0:PO:KQ:lk:9G:yJ:Ws:wO:U7:2M:mZ:Og:Ow:mU:Fh:VH:W2:To:xJ:t5:2m:F5:qq:6T:9X:Hp:Gx:PQ:rG:yY:gc:hD:Jf:xt:ul:yq:6M:HM:If:3P:mw:Jh:Vm:BH:5P:0c:5k:ts:SR:Co:XJ:fD:Yk:Ib:Wy:bY:XX:yK:gZ:ns:WK:Ib:3o:Eo:uM:g5:Su:34:tQ:mK:rO:3R:06:9g:v6:Jz:4y:lq:Vk:OS:HW:mt:d2:yt:iO:Sq:4g:Xx:2G:Rm:vQ:mk:fb:qe:UY:G6:tN:YN:7f:T7:CZ:Yp:yn:bP:0S:jJ:cF:Mq:iL:Xh:JM:bT:PS:Jy:3v:93:N6:xx:Ms:Nz:oZ:rI:2r:4P:a2:p9:Pe:cp:PT:sk:12:oK:VZ:j7:58:tM:g7:gx:Ye:Em:nK:dy:NN:J4:hN:fZ:hr:RT:K5:gI:sp:vc:Yh:q1:2d:jm:zc:lx:lP:rn:zV:m6:PS:w0:U8:Y2:hw:Dh:4t:TX:xV:LQ:5E:Gm:uU:y3:Op:ch:pz:w5:ZP:iN:6v:v5:ez:cK:RL:68:jU:7b:7z:Vr:6d:LH:Ks:ZI:IO:cz:N9:va:oC:oT:2V:D6:zD:oe:E6:B2:1V:Ys:7N:18:hW:df:9k:Jm:9W:Kv:5T:yq:L6:JU:5k:Wn:Hv:9e:uG:p5:7p:LQ:Yy:mi:ll:MG:Lk:WM:Ba:t2:Oq:0E:mL:oj:aT:uj:vj:90:vt:9j:vE:ja:RJ:5C:rx:gG:pN:SG:6I:PJ:mV:zv:aU:7y:PM:r8:N8:DO:Eb:j6:bZ:Sk:eG:ow:9K:pu:07:0k:WS:oq:8T:rY:0U:yY:GM:xg:Np:tg:eO:wg:dL:br:Pj:6O:NN:Ib:bk:Kn:3j:I5:gf:x5:UT:o0:nM:p8:La:qG:sg:Op:dn:qC:xj:uf:0k:01:WG:gj:qY:vE:qn:dt:0J:jC:OO:7z:fB:lm:qh:8V:2m:hr:ub:1k:wc:xJ:wr:BO:SO:HV:rA:Rf:u5:9b:lM:hQ:y6:9q:fM:lV:G0:vz:b7:eh:zq:1l:Pr:O1:qP:jD:ZY:bE:EX:0S:4m:WR:vd:Ic:67:T2:0m:R2:XT:Ce:In:ns:Ww:t5:OS:6l:j0:9l:9P:Ha:uO:5M:oM:Yv:lN:LY:0e:8l:Yz:AY:6r:Q5:0j:kb:HX:Lp:rP:eJ:pQ:W0:Ii:nh:Mi:Va:fE:Bs:x3:hD:jc:qR:09:gp:BO:ko:Wn:t7:jF:MI:0J:dC:e6:Vk:po:tE:fQ:d4:15:pq:yJ:iY:RW:3R:im:08:2A:ww:2U:KY:wp:Cg:40:yc:NF:AB:8q:u4:qn:xm:mO:yV:HM:IZ:Zo:sC:fv:XD:DD:GJ:zy:Gc:lX:zl:K3:VA:8V:ol:8v:b7:5s:RH:mJ:By:Ft:Ib:RK:Bc:TY:dW:pE:dm:1R:6S:yE:DE:y6:No:aJ:Nr:8a:Kr:AP:Zv:Xg:DA:ln:GU:Lh:qu:vs:0a:KK:1M:qQ:HP:nN:zN:0j:zQ:mv:g9:cI:MX:PC:lQ:oE:wX:iT:5w:of:9U:yS:8w:lL:ke:UM:6M:Vf:7b:Xy:Tq:2f:rV:7B:a5:Zm:xE:PI:OH:yh:PV:A1:W5:L6:3W:5B:CC:VQ:Ei:Oo:4Z:y0:YU:Lx:Nb:PL:SG:uU:1U:68:mu:jM:qW:QB:6I:JF:Nb:iF:ph:E8:eA:aZ:KZ:D5:YM:2S:H4:Ep:vK:GO:3M:0i:Zl:BQ:cn:Mp:oW:uP:Go:lK:fy:OI:vQ:Wo:4E:hF:tN:i1:Hf:rb:Cj:8f:ST:nt:bZ:Z9:Vj:gd:LI:bM:dJ:m0:6t:cZ:I2:BP:YB:NL:l4:RU:G7:6d:qE:7V:NY:a2:5c:Rp:vc:Ps:Bm:rC:O5:WS:d4:wq:Jl:hM:7M:eU:xR:Nl:AT:7x:Yi:vB:pp:QB:1X:xn:pp:OS:Sk:oK:6F:W9:A8:9t:7j:bn:z0:tU:t7:iV:9D:0K:05:XC:V7:hU:AW:U5:hr:AT:d5:lM:xR:PM:ky:Z7:k8:d6:Pp:6T:ac:3T:HN:7Z:ot:zg:1p:GH:1r:jL:JM:n1:5v:HY:cO:sj:2r:zk:H9:jv:uB:cD:yx:D8:Jo:VW:UB:E5:pi:Ov:y7:mh:QA:3f:DX:bc:MX:QO:Jq:Gh:qJ:oR:kL:JP:7V:iE:eB:vv:FS:2f:kW:Xt:T0:w9:wh:Od:jA:l2:8X:g4:Wt:9h:yG:cR:HG:yg:V3:Wt:rI:BB:M0:kL:AR:Um:R3:k6:zz:ME:Px:cK:jh:9t:2J:pH:y9:89:K9:jk:Yx:vB:69:IJ:AX:f6:Kq:bj:q1:Iv:55:K3:7B:Mm:6L:Q3:nR:zO:jD:JN:MJ:JI:Ak:eW:fG:4S:dK:qS:xE:EQ:wY:xm:AK:a1:eH:YA:pD:s2:6l:Vp:Bi:wE:gk:g9:MQ:b4:oD:06:yb:HV:63:dM:Gu:ze:Hj:KZ:TO:55:l0:Jd:zU:6f:cS:fw:gY:hD:xE:6L:75:5u:6Z:ti:m2:oh:mo:0K:DJ:FK:K4:U7:TO:2J:ns:BL:uq:f2:QF:t5:7C:qb:2v:FK:ml:nt:qL:1n:LM:ux:g5:xB:Oi:80:pv:Hp:YO:zn:Na:2I:n4:DN:5b:Ty:4a:xM:9w:sL:1s:MY:9G:hi:cT:TL:h0:M5:Dq:wK:uB:sR:vL:D3:gO:KW:Gd:nu:vl:fW:vq:zG:c6:pq:Ie | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	υ�<�CNA���X���G��#�\����P7,�c��wx!�B5��LO��p�K�x�Z�J=���u�h/5��/��.Ec,ڹ?ǥ��Ѩ3���*��w/"�\�vx�TR��ml��$q7���<�B���Q�����~��4�]`�/d��]���<q>σܕ�C�a"�X<᪻rZ(2����4q�v0N��sű�QC���}���T��ƨ�4�?f&%���k4i3P?�����A�n��[ i���{v�ai������W���"Ĝ���_��-W��8~u;45�¹*�%<�_�;��w{{�c����*9j�����=��\���K�pe�uFu�3E��c(;�V^&_����:��++s��횝���eh^��S���o���Ȉڙ�9�~)�b�Q�%�j{����a��AƲL\��o^$(�R��FCh��ɚ�1)逆y��~��aբ%�!G!�@4&+촴���ƶB����6�RL��8�������,ܟ9��&CmDT!u�QIqR�ΗګHlY���*��!B�K�CK]�.C�rP�ܮr��myM��(L8���}���{�������I�V��7�C�䇾�̧��b/�g���?uՂ�$wp�7�nԯ�&kԉ��7[o-����ؖ/x $o�r��I��z�#��j�q��!�D�.x�wb��;��4�㙚U�̓�.1%Ψ��ʴ�Ɯկ&�mcS������R�<a�J�M����@��\R�e5C�P�Z����a��<���k�o��~i12��S-:��ѤO��t�4ɝ;�r����G�v0�T{�,��x�|Ԑ׏<b@�l1�%���;b<��7=Ƌy�l���A	��)(����E�]��﫟����MzB@FT�X������
.٪���
�J0�-��l�@s�svN"�h{My�ҁ�s,�=�t�mm�E����p���QŌa�>��g�xV1�E�)�}�T������4C_Mi��)+E�X�g�Sb�a�@�sX�TeX[�Y���9��/]��<�U���c�:�t˺��~(wB�+��v��u-hI^%��m�tz�/u���,w0x=��`��%:f�(O�פ۝p@<��޴,O��G�,D��!{�I[0��A%z��Ǣ���b��Q�0���޸����ۂ7�I��i�����{�%�9���X��	�
�TQe�̍�zB�����3�#���3̹�u'i������u�$ݥ�g�Q��<1�M Mo�?��t��f!^�F��)� g��=�PX�0�r��r�&��/S^�S�2���I2,��zΚ:G�)�q�u����ipx��ew�_-#��/��2�
����A���f�٥^�V?^����ؓ�1[-ܣ�*>�<��zch?Qk��������z�Un� T� ��)Y�����0�R��K3�#S���}�ӛ��'Yw`Dr�c@�
�"w <���>-F������y������M
�&�7u��;cgK+����:�k����zj��婂�E��y��%�#f0�sJ �l_����!so�f�j�ͥR1��Ue�:��D9z	��W����c7I�R@��FBQ y���X|���$W�Q��h�-�"~��)rп�E����/>�^���mT\,��}_hT�����b��ˎU0+}����*�vid�'7�ͦZ-��0}J|��B�����3���$o�B���s�&^_ޏS��q�P���-D�Z�.��T����t<U/w\�\ +���X|��bR�$a�w޴����]���jA/�<�!�~�������Ǜ\<#��5E������rT7�m6+�e�˫���.Cb��^��Ŵ}{�O���ʕ�����AG'��ь��rZK��~�%��B�b��s�T�ߎIWB�ʌ,sU�U�,��ْgI�?��a2A�-UwP���4�_1w4s%q�~��0\C��U��C�k�s�)�4QaN��hΓ��`s.V�* Yԇ�����_���&�HЩ�|i/�T4��]%5L���Fۛ)L��tO�M��y�|Q@�|������p�g_-�ql�|�>W�V�M�+�����9V\����JYL������@�Er;<z��xX����^��>��ek�<5�<4�������}@�҈g�k*���sK$��CL�:\mG,����^��h��-�@R_���➲ޥN�,�K
�֣���<K�سފ'{5
�%��6���Яu E�X�g+6,���%�m=E��B����r�`�DR�ތ?5&�</��S���&�	l.�4�;+�
��]�&�w�蕠v�����6����޴����.�Z�R�$4�,�h�%\瞪2��%�ܯ7n&��@�/�s���\ݷI	�=Y�C��Ծ�D���P�6鼯������y�ſ�ܓ�R��а���7 pbܔM�-��I�X��㐵�}��m��8�w��M`ڮ�FN�s�n����s����f)��wD!�$dx��r
�t�EvB ���#P����	�9L�� ϖ��u?�un	bs9��eм9��q���E�&�څ��3�;Q�[R��~¡��أ�˥b��W�$ �ҡ^�E�m2W�0��T"l�l�m{T��S��q��;���$����lMg�?���؂L�H`�`��L``�-���ۋ��Pl�nC��x�6����	��[�b�c�T���S���ڪR_w�E�=� ��$=6xd�k��3F"���@�a�K��4D=2���*k�4+���cF�d����T�� �����~�d-����l�%sK<���f��ro�&�Vso���?�s�4V��9b;Z�Mq���a�}T�jt���0�aJj�Cu"Na/vb��⚝o �AN�TibD&Q��1S$��p��w6~�'��0�{�=�7{Q>Z�x�9���Y/�]	�I[�`j����"��;���t��F�OVdo���"{�F��*y�U�BouC��/CTŏ��*!"Dvgm�4�!��hh+���2i�� U�<*���e̫AFk��k��{
>Ζ�ҺN�,9���1�*e*���a�����e�C���)u��X��1KKC�*`ԟ��B� `�r�ά \`��g��ea�=�!�R`#��Ɖ�e�Q�(�E� ��X�4,h%�g*{!��n�����a�����rxf��;"��L�s6Q�d�m)���3-����x�����t~f�M1�ߌ�_x��|(ْ��yM��i��LeL��hf\s�e�p���19�Un��TK��&��1O@�c�n�"���˺XO���
	 �G��%F�y��� �QՔ�f�"J=l�lp=�b�����s����NUg��"���U��('�(���B����R���L����g�/F)�G�q��M��S��-����l�4��1���lF�j�qb��FJ�l}r�,� =-9�u(��o�F�?��`��j���LPJC�'��V8[$_���g�C5�d�a�H�|����킴�Qƿ)�릸��>4ݒo��H�(Q�"������3��z����\�9�3���b���\�q#1�̳�K+����:�b��4ڟ�C[(����桸�E�pBR:
� )~*�&��t1��e�W�\$��]��ۂ:r��ln�,v�l����E�kn�g�Q���B�Q{aU�9���P$q	�e�������&�W����Z녃,�lX���j)рg�w���S�JG�4I�
��@�M��n�`����d,����*לA�{I����V�z��p��їM�%~,y�!�ەW����� ���v��:�\/�J�p�e%e��E�tKIK�gQ�����I�E')l�a��[�>LQ*����]�������B/f���Uɤ!%�1��>�YՔ�&E���?�:v�q/:v���Y"����e����kD>��J@Oz�¯�AW	��[�)�h� �s{�f:��O5m,���l�u��/��⻙ ��~V���;�"G�[�z��4���ag>�L�Df��I�S�F�j#����8�/���y�@2S}LKd�gu,�t9�O���i��e(,��H��2ʰ���_�N/{��&�F�U���L{Nwh��1�.�D�t�6���-��8.�8#�<v3&Lw���Y�z���<�H��?��tw?�_a�^8�i�-T����q0t�+VI�2��b�6c�y"��@��[��U��
�#��q�i�~i�DNIϕ�%��ԋ��3��:pĆQ��=t
�E���'���A�k����d��iv9>�FL*����]��5��������]�ϱ�`W�>#���<��`e��N��Oy"����Ԧjt����q������K�Ⱦ0��[��"�bt���C����� %1�n�&X�Ħ��>��Є)/-U�X���~����[��3d6���0�Er �|<>Em�*�cX-�m�@~��T̊�ED���_b�X�pL�Y*=�C����̍�Ğ�4��?=]��ީ�DX+����4S�˱��
�o `�y����B�J����.�.05y$�|W%8c��7�^�a�cV?�������f�r��c�S#��UL��,?�f�,\�0���ն��d���˨<@�K������kZ�JҪ=Y�/s�E���60�@��r�%P�v�bd�`4�(�`|�Y��� (@�n�������p�E�&�p�BB,���G�3ìy���ߘ�K&~�}�V�\�h�.Fa��I�sD��)�2��$mM9�7�D�r��|M�<���$i�\K�6�ˏJ��t�����g�ǽfw\�2��˯gc��������Ң���PF*~$/�_hҾ������?.Ȫ�P�]f�0�Μ�I���1uL�B������n�����Q�������xN<��i�v75�=�e
��u�n��y��5 �dZBgL�B=¥�qY[��浳���	H��jk'w&��Vo�J�(#��
E�AŋA���3-����2HA����˳օLV�F :�/J��� �Lk�rpKݻJ5��%i�{�Ƚ7]|�Ƭd��&&"�'Ҧ
\dn1���Fv�"])lcbA;'r#
]�ʈ_v��1``�F�\Gb��fbM�qG��o��<B[�_��K��(h��%z�3�#�10Fƛ���c��I8��~+t��� ��<L�l��A�.�ǇI� ��f��ܱ�ނٰ�mIF�H��~'�a2�j��=_�g���;^���T���E�nUC�y?��ޑ��cw���$�/ʜ�j�m���J���x(P�u��_���8�X6qh�ų�kK�>5��|J;�'��_H0`#�mOg�5�t��{�����d6ƿ9N�-Ղ�}����^�_t܅�?���~C6-1�~�+	m�p��
cw&�	���[�$����{��s����Hk�FkaU�_���8v��� ̙��ކ��)�1��K�?��Ą)6/CD>SHcl�⡯�D����k�sw%@��S�N��Q�z����V=w��[�z�/��y����U��~����0���T�:okɳ�k�����tH^�j�<l�G�D~�v{q0S�rD����j����k)/{y��F�A��4x
��z��щ�QmOőe
����:��α�,V�ԍc��J��#���Q��b��)�wQ�����њ��lѡe�{��4���6=m�P_(3����֋�{ ?�����dd���G{ի@���ւ�e����]]�.��O�Z���@,����Jܸ��b�݋�A��ey&Ñ�S���L�J\c8j��cm�>�*؋��Of��ꍠ��5Pe���`��?ݰm���.XB�Y�a�/�B�#�[gf�;<�n_H���ހ����/�Ǣ�.�+��́�v�d+NW"�vߞY��mb_;����%�lK���0Y�;k:�RBk��T��T6� k�����)�P�ew�7aWo��8�+C�96�i͑$"G~&v}:g������;���߇�S�U��f<�?R��A'��U��l��5��@hWẁ����[w�J=IAE�Rc�B�O�:����5�xj��"��U喎c'�e�uS�T1�]l:�v2��)�C�B� 
g��ч[V\�>�W!|v���f;减0`0�]tF�Ib󕋝��)�2NNզ:���X&�u|hQ3#��r���j`�$������h\��tπ6�^�`O�s�D���̂Oq��?c)� 
�~��@��_1RM��j`2\o)��;KY�����>����.ϰ|��h��E��)��	..���0�����7=(2��y����"$42��x�GU�]��$"�Fty�pvYƍӊy?�?_�DZ������hv�izc=	��z�(u�/Ɨ��K�W-�����y�#G����&��n��sB����R��H?g[�y;aٱ�{_L�σ6�+s^��HbPj�C~�~�JEN�����[�}�m:��ƊJ�����+V��8�N�Q�02��!�K��C��֒&L�lfɞ�E
9	]�Gh~��ʌ�������æi܌��x-S>�OT�G�#�ǘ6C������ ��8P9��>�hY$ݩ��+n��T�zH����,b�hV��-;���3Mo��D�~��+�l�5͈jY̛��QTͦ��&]��Em�s@��M @����N�o�ԳIו����|��m���,k_�2��+
RH��R��}���ӧm]�Ln�����C����_ۄ}������W�s� e�Ց_l��/*6�(@�����gZ���&��I���m�d����D������F)U6��Ӆ���2� �����~!�F5��[�Q�:�����b���x��cA�W��-"Jف�W����Ѻ/W|���H&���G����B��� .���O?��%�Ǌ�r�RsO���7_�#�Ǵo�9X��Lrx��G��7������9b�c��k8�o@�|��O/�;��Ο~�Î=z%뾎��-3�V�ȭV�6oW��&$�B��?���a��d��u���ii�����N��`~;��Rm�Y��	Ltt�1`����JD(�kK��s�t�Q}E���lu��?�A��:{?�YecL$��~c��3�:�#}.�w�Ac�ϝ�iA\JL��z}�`����=�H���` WK_�x:�e����[�v������yMMҞwf��oԫP�֍a�m�t�Q��ACg���Ϙ�ѓƏ��7Y�����g�=����fe�� ��;-}�%"�Z$co��Y��J�'��t��HX��%S������lѓ�8p�l<g�7��������C'P�"�W��g�l<�����|����bq5���׉�^���a�r�����/A?l�&��r��
ϱ�F�����l`$���{�%�F�8���!*�x�'�m{���ޯ;KH���8{uT�#N0$�[况�|�k�쿽�Y8;��tf`"�0�M�6	gk/ˉ	ʕ�E�B�� }�r坽u��u#f��ui;�O<?�smԑ��t��^~ar٨�.{�W����fF���t�g
�yBPq�����Z�|�C]��s�"p\"�G��'�U�v�hEV@W<�C`�Ib�$��J:��b,��O�Nh���Ϲ����ћ}�Jk��1#ڶ�,S~{�l��</����A�v�M��S�>�����r����P%�}Z�.���E/�c;Kťu���P����<nF*!So>T����`�u��Fv�V��`[��U�E�sj"��&�8,>��w�A\�5�(���<ý�����7���~I��k���{�r%R�J1>��1�3���k��ND�츣�s}/�/�t�U+� ��@9�EQ�g�H���p���̣�$%me�q��pl�F�|���>�y?�eH(���C�����!e�"����s������N�R���` �ފ�5"Eէ��;'=��3�u-�T�t��ϒk�w���_Ԫ�h?A��%�uS��"��:�B�kh�)�RE#g�{ӚU)wS����>���! F(���˱S�ɮ�� ����%~�87:��C�A��y��ƻF|�2���]x����tpșH�������������%�p��B��د��c�a��`��5���mR���O�L�,��7���p)|�, �Q�R�l ��_������.�A.���>��̣�7��J�f�*V�52n}
_��Jl�1
g�	n
��v�����Z������C��!G���9�lT�:���ePy���q�@PP9PH��,��M�S�Ru��s�)��}����z��W��i����</=fM����o�@��a3T:^G��Ӈ������a�Se˛�=�Q^a�I�P��D�6�|	r��ݛ�f�b��VH�Ri���lyB���)JN �̢���q���r�	����t��p#�Z��Y�+����J�X�D��9F�d������$@���M�K��[X)r�[�K�k2�񺝶g������6؜���p�T��/�?�ijfOQ�I�)~�\	�4�iF~Ӊ�儰�o��?Յ&�Z��q���'����t���݇Z6�%�<�-j�>7r�m	˳P�ڸ�s����m�i� o��VR���RZ���4��4��j����W�him�0��(�G�w��\C����.������!�&�s����b#\Ud���H=
��?�T���""Q�y��o$��m*����E��8whlv�.ǝJaP�8�կ-ƣ�+������ZE�YͯO�V�e�I���}��.k�8� a��@���o��o��j�O�Q�x/4��:���*U�n��vE}l͜��1�'��>4B�w]�.8%��[{�&�cX���:n@��_P�m�$��1��䌄ю�)����3S����[H�~uo�A�������'L�!�Kr��M����!�m�mcB@d�]]��xo�k�.��ÖA.��H�Z8���ֵw�}��ǥ ��F��r/�`�y��gO!��h6"Z4�~�Z[�Û���cUh�G�j�㜌�E�9Rv�é��*ٍ���o��[|;论Ѱ�׎���p� ;	Z"a}{Iob�1�_�T�*���=[B�q�XS��2� ��鐀�R�V��A�'����YP)���`g�m�}|��}��M*= �����7��q-�-��ADSZq�9p9Qf�3\o�7��h�:/���u�aO�{��rd��7V՞Pʉ�2�{<���)Oo�O`�� l^�ku	����o:>Y)���Ķ
��{��n�(=3�FȊa�i
�bp��MNtFn�n��_	b+��J�>�6�'s�W�a��i�i�b�GQ�	
Bc�Zo��<�T����X��Q�͞��!'kL-���'�5�	�JV{$�q�-�hw`��]��3nE@����$�d�B�������3^!l�U��7���2`����U����ԣmL �?���$�Žg$]A�bZH�ߕ"b!.�D�?\�K�&GZ|h��x��!��F�w���~�,`DR3\6� �6 ��5s��Z��Os��3*'���\�&07���\�.�T�)�x�`���
�X�'�<�?��
�e��7���Ah�Zx��S�ϓ�}��,͆�0v��X ���xS����l��劶�X\3+o�=r�#�Z���>3���i�/�j�߳�<'e^[{�K�F̧e�sO�k��dԈ�X�Ft����Lg�N�^��i��!�D=J.�/(]� ����w�a�U��)h"יU3vɕϪ����|x��;����P�`�AT���<��j&x��J��^F1�`��>�n.��˱͑0^Ϥ�o��">xp}F�ϟ�*�+�i?�Ok�1K����&q���r������aަ[��KAH��J50��	���QNg��4����OI���cx�I@�1� ��I��x䐢֔�����7OvJH��5��Dl{�=���0nMS�-���¾Z���`0��슼a��k�>��:�g�ߓ8��%�?�������)��LS�o�%�[�>����&�-��,�.a��f<F��,G�W!	�UB���k/b0+��1�=���HL�R�v����񮅾��$d��r<޾X`Y�����l$���K�Ӵ�]���u�� '7��gj��x�f������ݿ ���R*��gmS�bmn�pH��2
�<t�fj;��%W*�a�	mT�QW�����:��]:�O�lsI�Y��9e%	��ė��,�;�U�� A���>nS�o�n�4.����}��R�������o*�"!��K��N\
�DX @�o���Y^ԛ��O�y��K�kזi����~m��d5��g��͘����dRC\���\��Z�
)�Nu6'�� �i�5��<�Y����.Ç�v��p��h��vR	t^�����6!��a���y5�� �M���\�?� ��N�g���(5�*�.�Ƣ!䴹�;j�]S ?�̈^f��9q�.N�C�m ��+�]&Jc�\_�ֹ���A,�.�:��7�Qٟzt����ᄵ]�<)�`�x,a\t�r�y莨�������9�Cd;H�,���T����K��F5��7�)�U���)Q�ٱ��h����q�VD  u�5�M�7���&OpXj���j5	��#�el�`��W=��ii��,e�q���~�7��'E����P/b��L���,f�����1��rt�$�_QlEZ�`��-;�