% Name: Yuhan Shao, Login ID: shaoyuha, student ID: 1002281327

%success
test_sent([the,teacher,slept]).

test_sent([the,teacher,tried,to,sleep]).

test_sent([the,teacher,appeared,to,sleep]).

test_sent([the,teacher,promised,the,teacher,to,sleep]).

test_sent([the,student,expected,to,sleep]).


%fail
test_sent([the,student,try,to,sleep]).

test_sent([the,student,promised,to,sleep], fails).

test_sent([the,student,tried,the,teacher,to,sleep], fails).

test_sent([the,student,appeared,the,teacher,to,sleep], fails).

test_sent([student,appeared,the,teacher,to,sleep], fails).
