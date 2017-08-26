\d .q4q

/ (b)ase url, (f)ile
download:{[b;f]
 if[()~key lf:`$":",f;lf 1: .Q.hg `$":",0N!b,f];
 lf}

uz:$["w"=first string .z.o;"\"C:\\Program Files\\7-zip\\7z.exe\" x -y -aos ";"unzip -u "]

unzip:{[f] system 0N!uz, 1_string f;}

/ garman klass volatility
gk:{[o;h;l;c]sqrt avg (.5*x*x:log h%l)-(-1f+2f*log 2f)*x*x:log c%o}
/ garman klass yang zhang volatility
gkyz:{[o;h;l;c;pc]sqrt avg (x*x:log o%pc)+(.5*x*x:log h%l)-(-1f+2f*log 2f)*x*x:log c%o}

/ pivot table
pivot:{[t]
 u:`$string asc distinct last f:flip key t;
 pf:{x#(`$string y)!z};
 p:?[t;();g!g:-1_ k;(pf;`u;last k:key f;last key flip value t)];
 p}
