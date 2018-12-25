% Name: Yuhan Shao, Login ID: shaoyuha, student ID: 1002281327

:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal].

        % parts of speech
        pos sub [n,p,v,det,toinf].
                toinf sub [].   % infinitival to
                n sub [].
                v sub [].
                p sub [].
                det sub [].
        % phrasal categories
        cat sub [vproj,np].
                vproj sub [inf_clause,s,vp] intro [mood:mood, gap:n_sem].
                        s intro [mood:indicative].
                        inf_clause intro [mood:infinitive, rec:n_sem].
                        vp intro [mood:indicative].
                np sub [].

        verbal sub [v,vproj] intro [vsem:v_sem].
        nominal sub [n,np] intro [nsem:n_sem].
        
        % mood and tense for verbs
        tense sub [past, present].
                past sub [].    
                present sub [].
        mood sub [indicative,infinitive].
                indicative intro [tense:tense].
                infinitive sub [].

        % semantics for verbs and nouns
        sem sub [v_sem, n_sem].

                % semantics for verbs
                v_sem sub [try, appear, promise, expect, sleep]
                      intro [vform:tense, agent:n_sem_or_none, theme:n_sem_or_none, ben:n_sem_or_none, exp:n_sem_or_none, gap_type:type].  
                                n_sem_or_none sub [n_sem, none].
                                    none sub [].
                                type sub [object, subject, none].
                                    object sub [].
                                    subject sub [].
                                          %  the following subtypes:
                    appear sub [] 
                        intro [vform:tense, agent:none, theme:n_sem, ben:none, exp:none, gap_type:none].
                    try sub [] 
                        intro [vform:tense, agent:n_sem, theme:n_sem, ben:none, exp:none, gap_type:none].
                    promise sub [] 
                        intro [vform:tense, agent:n_sem, theme:n_sem, ben:n_sem, exp:none, gap_type:subject].
                    expect sub []  
                        intro [vform:tense, agent:n_sem, theme:n_sem, ben:none, exp:none, gap_type:object].
                    sleep sub [] 
                        intro [vform:tense, agent:none, theme:none, ben:none, exp:n_sem, gap_type:none].

                % semantics for nouns
                n_sem sub [student, teacher].
                    student sub [].
                    teacher sub [].


%Rules

s_rule rule
s
===>
cat> (np, nsem:Subj),
cat> (vp, vsem:(vform:past), gap:Subj).

np_rule rule
np
===>
cat> det,
cat> n.

% The student slept.
vp_rule rule
(vp, vsem:(vform:past, exp:Subj),gap:Gap)
===>
cat> (v, vsem:(vform:past, theme:none, exp:Gap)).

% The student tried to sleep.
vp_rule rule  
(vp, vsem:(vform:past),gap:Gap)
===>
cat> (v, vsem:(vform:past, agent:Gap, theme:Gap, ben:none, exp:none)),
cat> (inf_clause, rec:Gap).

% The student appeared to sleep.
vp_rule rule  
(vp, vsem:(vform:past),gap:Gap)
===>
cat> (v, vsem:(vform:past, agent:none, theme:Gap, ben:none, exp:none)),
cat> (inf_clause, rec:Gap).

% The student expected the teacher to sleep.
vp_rule rule  
(vp, vsem:(vform:past),gap:Gap)
===>
cat> (v, vsem:(vform:past, agent:Gap, theme:Obj, ben:none, exp:none, gap_type:object)),
cat> (np, nsem:Obj),
cat> (inf_clause, rec:Obj).

% The student promised the teacher to sleep.
vp_rule rule
(vp, vsem:(vform:past),gap:Gap)
===>
cat> (v, vsem:(vform:past, agent:Gap, theme:Obj, ben:Obj, exp:none, gap_type:subject)),
cat> (np, nsem:Obj),
cat> (inf_clause, rec:Gap).

inf_torule rule
(inf_clause, rec:Rec)
===>
cat> toinf,
cat> (v, vsem:(vform:present, exp:Rec)).


%Lexicon
appeared ---> (v, vsem:(appear, vform:past, agent:none, theme:Theme, ben:none, exp:none, gap_type:none)).

expected ---> (v, vsem:(expect, vform:past, agent:Agent, theme:Theme, ben:none, exp:none, gap_type:object)).

promised ---> (v, vsem:(promise, vform:past, agent:Agent, theme:Theme, ben:Ben, exp:none, gap_type:subject)).

sleep ---> (v, vsem:(sleep, vform:present, agent:none, theme:none, ben:none, exp:Exp, gap_type:none)).

slept ---> (v, vsem:(sleep, vform:past, agent:none, theme:none, ben:none, exp:Exp, gap_type:none)).

student ---> (n, nsem:student).

teacher ---> (n, nsem:teacher).

the ---> det.

to ---> toinf.

tried ---> (v, vsem:(try, vform:past, agent:Agent, theme:Theme, ben:none, exp:none, gap_type:none)).

