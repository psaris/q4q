\l q4q.q

/ https://www.cmegroup.com/confluence/display/EPICSANDBOX/Time+and+Sales

b:"https://www.cmegroup.com/market-data/datamine-historical-data/files/"
d:()!()
d[`corn]:"2012-11-05-corn-futures.csv"
d[`crude]:"2012-11-05-crude-oil-futures.csv"
d[`emini]:"2012-11-05-e-mini-s-p-futures.csv"
d[`eurusd]:"2012-11-05-euro-fx-futures.csv"
d[`eurodollar]:"2012-11-05-eurodollar-futures.csv"
d[`gold]:"2012-11-05-gold-futures.csv"

-1"downloading sample time and sales datasets";
.q4q.download[b] each d;

f:d`emini;                   / change value to load different data set
-1"loading CSV time and sales dataset: ", f;
/ t:("DVICSCMIFFCCCCSCCCCCCDS";1#",") 0: `$f
t:(" VI   MI FCC         D ";1#",") 0: `$f

-1"renaming columns";
t:`time`seq`expiry`qty`px`side`ind`edate xcol t

-1"generating trade table";
trade:select `p#expiry,seq,time+edate,tp:px,ts:qty from t where null side, null ind

\
.q4q.pivot select vwap:ts wavg tp by 0D02 xbar time,expiry from trade
