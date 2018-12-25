% Name: Yuhan Shao, Login ID: shaoyuha, student ID: 1002281327


number sub [sg, pl].
nprp sub [true, false].
	sg sub [].
	pl sub [].
	true sub [].
	false sub [].
		
cat sub [s, n, np, v, vp,  pp, p,  det].
	s sub [].
	np sub [] intro [noun_head : n].
	n sub [] intro [noun_num : number, prp : nprp].
	vp sub [] intro [verb_head : v].
	v sub [] intro [verb_num : number].
	pp sub [].
	p sub [].
	det sub [].


% rule


s_sg_rule rule
s
===>
cat> (np, noun_head :(noun_num:sg)),
cat> (vp, verb_head:(verb_num:sg)).

s_pl_rule rule
s
===>
cat> (np, noun_head :(noun_num:pl)),
cat> (vp, verb_head:(verb_num:pl)).

vp_sg_or_plrule rule
(vp, verb_head:(verb_num:sg))
===>
cat> (v, verb_num:sg),
cat> np.

vp_pl_rule rule
(vp, verb_head:(verb_num:pl))
===>
cat> (v, verb_num:pl),
cat> np.

pprule rule
pp
===>
cat> p,
cat> np.

np_nrule rule
(np, noun_head:(noun_num:pl))
===>
cat> (n, noun_num:pl).

np_nprprule rule
(np, noun_head:(noun_num:sg, prp:true))
===>
cat> (n, noun_num:sg, prp : true).

np_det_sg_nrule rule
(np, noun_head:(noun_num:sg, prp:false))
===>
cat> det,
cat> (n, noun_num:sg, prp : false).

np_det_pl_nrule rule
(np, noun_head:(noun_num:pl, prp:false))
===>
cat> det,
cat> (n, noun_num:pl, prp : false).

np_det_sg_n_pprule rule
(np, noun_head:(noun_num:sg, prp:false))
===>
cat> det,
cat> (n, noun_num:sg, prp : false),
cat> pp.

np_det_pl_n_pprule rule
(np, noun_head:(noun_num:pl, prp:false))
===>
cat> det,
cat> (n, noun_num:pl, prp : false),
cat> pp.

np_npplrule rule
(np, noun_head:(noun_num:pl))
===>
cat> (n, noun_num:pl),
cat> pp.


% lexicon

biscuits ---> (n, noun_num:pl, prp:false).

dog ---> (n, noun_num:sg, prp:false).

fido ---> (n, noun_num:sg, prp:true).

feed ---> (v, verb_num:pl).

feeds ---> (v, verb_num:sg).

puppies ---> (n, noun_num:pl, prp:false).

the ---> det.

with ---> p.


