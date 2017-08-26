\l q4q.q

/ https://www.cmegroup.com/confluence/display/EPICSANDBOX/Top+of+Book+-+BBO

b:"http://www.cmegroup.com/market-data/datamine-historical-data/files/"
d:()!()
d[`corn]:"XCBT_C_FUT_110110"
d[`crude]:"XNYM_CL_FUT_110110"
d[`emini]:"XCME_ES_FUT_110110"
d[`eurusd]:"XCME_EC_FUT_110110"
d[`eurodollar]:"XCME_ED_FUT_110110"
d[`gold]:"XNYM_GC_FUT_110110"

-1"downloading and extracting sample best bid and offer datasets";
(.q4q.unzip .q4q.download[b] ,[;".zip"]@) each d;

-1"loading fixed width bbo meta information";
m:("HSHHJC*";1#",") 0: `:bbo.csv
-1"nulling unwanted columns";
m:update typ:" " from m where not name in `expiry`seq`time`edate`side`px`pxdl`qty`ind`mq

f:d`emini                    / change value to load different data set
-1"loading fixed width bbo data: ", f;
t:flip (exec name from m where not null typ)!m[`typ`len] 0: `$f,".txt"
-1"merging date & time and scaling price column";
t:update time+edate,px*.01 xexp pxdl from t

-1"generating trade table";
trade:select `p#expiry,seq,time,tp:px,ts:qty from t where null side, null ind
-1"generating quote rack";
quote:select distinct expiry,seq,time from t where not null mq, not null side
-1"joining bid quotes to rack";
quote:quote lj 2!select `p#expiry,seq,bs:qty,bp:px from t where side="B"
-1"joining ask quotes to rack";
quote:quote lj 2!select `p#expiry,seq,ap:px,as:qty from t where side="A"

-1"joining trade and quote tables to generate time and quote table";
taq:aj[`expiry`seq;trade] select `p#expiry,seq,bs,bp,ap,as from quote
-1"generating open/high/low/close summary";
ohlc:select o:first tp,h:max tp,l:min tp,c:last tp by expiry,0D00:01 xbar time from trade

\
/ garman klass volatility
.q4q.pivot select vol:sqrt[252*24*60]*.q4q.gk[o;h;l;c] by 0D01 xbar time,expiry from ohlc
/ garman klass yang zhang volatility
.q4q.pivot select vol:sqrt[252*24*60]*.q4q.gkyz[o;h;l;c;prev c] by 0D01 xbar time,expiry from ohlc
/ volume profile
.q4q.pivot update ts%sum ts by expiry from select sum ts by 0D01 xbar time,expiry from trade
/ time weighted average spread
.q4q.pivot 1e4*select sprd:(time - prev time) wavg (ap-bp)%.5*ap+bp by 0D02 xbar time,expiry from quote
/ second by second volatility
.q4q.pivot select vol:sqrt 252*24*60*svar tp-prev tp by 0D01 xbar time, expiry from select last log tp by 0D00:01 xbar time,expiry from trade