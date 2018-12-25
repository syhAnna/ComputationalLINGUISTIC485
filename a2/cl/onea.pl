% Name: Yuhan Shao, Login ID: shaoyuha, student ID: 1002281327

cat sub [s,npsg,vpsg,nppl,vppl,vsg,np,vpl,pp,p,nprp,det,nsg,npl].
	s sub [].
	npsg sub [].
	vpsg sub [].
	nppl sub [].
	vppl sub [].
	vsg sub [].
	np sub [].
	vpl sub [].
	pp sub [].
	p sub [].
	nprp sub [].
	det sub [].
	nsg sub [].
	npl sub [].


% rule

s_sgrule rule
s
===>
cat> npsg,
cat> vpsg.

s_plrule rule
s
===>
cat> nppl,
cat> vppl.

vpsgrule rule
vpsg
===>
cat> vsg,
cat> np.

vpplrule rule
vppl
===>
cat> vpl,
cat> np.

pprule rule
pp
===>
cat> p,
cat> np.

npsg_nprprule rule
npsg
===>
cat> nprp.

npsg_det_nsgrule rule
npsg
===>
cat> det,
cat> nsg.

npsg_det_nsg_pprule rule
npsg
===>
cat> det,
cat> nsg,
cat> pp.

nppl_det_nplrule rule
nppl
===>
cat> det,
cat> npl.

nppl_det_npl_pprule rule
nppl
===>
cat> det,
cat> npl,
cat> pp.

nppl_nplrule rule
nppl
===>
cat> npl.

nppl_npl_pprule rule
nppl
===>
cat> npl,
cat> pp.

np_npsgrule rule
np
===>
cat> npsg.

np_npplrule rule
np
===>
cat> nppl.


% lexicon

biscuits ---> npl.

dog ---> nsg.

fido ---> nprp.

feed ---> vpl.

feeds ---> vsg.

puppies ---> npl.

the ---> det.

with ---> p.

