# Q for Quants

Clone this project and start q with either of the following commands
to see q load and analyze either 'trade and sales' or 'best bid and
offer' data.

Note that the you must first dissable KDB+'s SSL verification by
setting the `SSL_VERIFY_SERVER` variable to `NO` in order to download
the files via the https protocol.  If you accidentally download empty
files, delete them and run the code again.

All six data sets are downloaded, but only one is loaded.  Change the
file saved in variable `f` to load a different data set.

Sample queries/reports are also provided below the file termination
character `\`.

## Time and Sales Data

```
bash-3.2$ export SSL_VERIFY_SERVER=NO
bash-3.2$ q ts.q
KDB+ 3.5 2017.03.15 Copyright (C) 1993-2017 Kx Systems
m32/ 4()core 8192MB nick nicks-macbookpro.local 25.34.72.89 NONEXPIRE  

downloading sample time and sales datasets
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-corn-fu..
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-crude-o..
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-e-mini-..
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-euro-fx..
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-eurodol..
"https://www.cmegroup.com/market-data/datamine-historical-data/files/2012-11-05-gold-fu..
loading CSV time and sales dataset: 2012-11-05-e-mini-s-p-futures.csv
renaming columns
generating trade table
q)trade
expiry  seq  time                          tp      ts 
------------------------------------------------------
2012.12 1977 2012.11.04D17:00:00.000000000 1403    1  
2012.12 1978 2012.11.04D17:00:00.000000000 1403    1  
2012.12 1979 2012.11.04D17:00:00.000000000 1403    2  
2012.12 1982 2012.11.04D17:00:00.000000000 1402.75 2  
2012.12 1983 2012.11.04D17:00:00.000000000 1402.5  1  
2012.12 1990 2012.11.04D17:00:00.000000000 1403    2  
2012.12 1993 2012.11.04D17:00:00.000000000 1403    4  
2012.12 1996 2012.11.04D17:00:00.000000000 1403    4  
2012.12 1997 2012.11.04D17:00:00.000000000 1402.75 27 
2012.12 1998 2012.11.04D17:00:00.000000000 1402.75 25 
2012.12 1999 2012.11.04D17:00:00.000000000 1402.75 70 
2012.12 2000 2012.11.04D17:00:00.000000000 1402.75 2  
2012.12 2001 2012.11.04D17:00:00.000000000 1402.75 1  
2012.12 2002 2012.11.04D17:00:00.000000000 1402.75 4  
2012.12 2003 2012.11.04D17:00:00.000000000 1402.75 20 
2012.12 2004 2012.11.04D17:00:00.000000000 1402.75 5  
2012.12 2005 2012.11.04D17:00:00.000000000 1402.75 100
2012.12 2006 2012.11.04D17:00:00.000000000 1402.75 1  
2012.12 2007 2012.11.04D17:00:00.000000000 1402.75 1  
2012.12 2008 2012.11.04D17:00:00.000000000 1402.75 5  
..
```


## Best Bid and Offer Data

```
bash-3.2$ export SSL_VERIFY_SERVER=NO
bash-3.2$ q bbo.q
KDB+ 3.5 2017.03.15 Copyright (C) 1993-2017 Kx Systems
m32/ 4()core 8192MB nick nicks-macbookpro.local 25.34.72.89 NONEXPIRE  

downloading and extracting sample best bid and offer datasets
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XCBT_C_FUT_110110...
"unzip -u XCBT_C_FUT_110110.zip"
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XNYM_CL_FUT_110110..
"unzip -u XNYM_CL_FUT_110110.zip"
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XCME_ES_FUT_110110..
"unzip -u XCME_ES_FUT_110110.zip"
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XCME_EC_FUT_110110..
"unzip -u XCME_EC_FUT_110110.zip"
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XCME_ED_FUT_110110..
"unzip -u XCME_ED_FUT_110110.zip"
"https://www.cmegroup.com/market-data/datamine-historical-data/files/XNYM_GC_FUT_110110..
"unzip -u XNYM_GC_FUT_110110.zip"
loading fixed width bbo meta information
nulling unwanted columns
loading fixed width bbo data: XCME_ES_FUT_110110
merging date & time and scaling price column
generating trade table
generating quote rack
joining bid quotes to rack
joining ask quotes to rack
joining trade and quote tables to generate time and quote table
generating open/high/low/close summary
q)taq
expiry  seq time                          tp      ts  bs  bp      ap     as
---------------------------------------------------------------------------
2011.03 230 2011.01.09D17:00:00.000000000 12.6625 752                      
2011.03 250 2011.01.09D17:00:00.000000000 12.6625 6   100 12.6625 12.665 73
2011.03 270 2011.01.09D17:00:00.000000000 12.665  5   94  12.6625 12.665 73
2011.03 290 2011.01.09D17:00:00.000000000 12.665  6   94  12.6625 12.665 68
2011.03 310 2011.01.09D17:00:00.000000000 12.665  1   94  12.6625 12.665 62
2011.03 330 2011.01.09D17:00:00.000000000 12.665  1   94  12.6625 12.665 61
2011.03 350 2011.01.09D17:00:00.000000000 12.6625 1   94  12.6625 12.665 60
2011.03 370 2011.01.09D17:00:00.000000000 12.665  2   93  12.6625 12.665 60
2011.03 390 2011.01.09D17:00:00.000000000 12.665  5   93  12.6625 12.665 58
2011.03 410 2011.01.09D17:00:00.000000000 12.665  1   93  12.6625 12.665 53
2011.03 430 2011.01.09D17:00:00.000000000 12.665  2   93  12.6625 12.665 52
2011.03 460 2011.01.09D17:00:00.000000000 12.665  7   102 12.6625 12.665 50
2011.03 480 2011.01.09D17:00:00.000000000 12.6625 1   102 12.6625 12.665 43
2011.03 500 2011.01.09D17:00:00.000000000 12.665  1   101 12.6625 12.665 43
2011.03 520 2011.01.09D17:00:00.000000000 12.665  5   101 12.6625 12.665 42
2011.03 540 2011.01.09D17:00:00.000000000 12.665  10  101 12.6625 12.665 37
2011.03 560 2011.01.09D17:00:01.000000000 12.665  2   101 12.6625 12.665 27
2011.03 580 2011.01.09D17:00:01.000000000 12.665  2   101 12.6625 12.665 25
2011.03 600 2011.01.09D17:00:01.000000000 12.665  2   101 12.6625 12.665 23
2011.03 620 2011.01.09D17:00:01.000000000 12.665  2   101 12.6625 12.665 21
..
q)ohlc
expiry  time                         | o       h       l       c      
-------------------------------------| -------------------------------
2011.03 2011.01.09D17:00:00.000000000| 12.6625 12.6675 12.6525 12.6575
2011.03 2011.01.09D17:01:00.000000000| 12.6575 12.6575 12.6475 12.65  
2011.03 2011.01.09D17:02:00.000000000| 12.65   12.6525 12.6475 12.65  
2011.03 2011.01.09D17:03:00.000000000| 12.65   12.65   12.645  12.6475
2011.03 2011.01.09D17:04:00.000000000| 12.65   12.6525 12.645  12.65  
2011.03 2011.01.09D17:05:00.000000000| 12.65   12.6525 12.65   12.6525
2011.03 2011.01.09D17:06:00.000000000| 12.6525 12.6525 12.65   12.6525
2011.03 2011.01.09D17:07:00.000000000| 12.6525 12.655  12.6525 12.655 
2011.03 2011.01.09D17:08:00.000000000| 12.6525 12.655  12.65   12.65  
2011.03 2011.01.09D17:09:00.000000000| 12.65   12.6525 12.65   12.6525
2011.03 2011.01.09D17:10:00.000000000| 12.65   12.6525 12.65   12.65  
2011.03 2011.01.09D17:11:00.000000000| 12.65   12.6525 12.65   12.6525
2011.03 2011.01.09D17:12:00.000000000| 12.6525 12.6525 12.65   12.65  
2011.03 2011.01.09D17:13:00.000000000| 12.6525 12.655  12.65   12.655 
2011.03 2011.01.09D17:14:00.000000000| 12.655  12.6575 12.6525 12.655 
2011.03 2011.01.09D17:15:00.000000000| 12.6575 12.6575 12.655  12.655 
2011.03 2011.01.09D17:16:00.000000000| 12.6525 12.655  12.6525 12.655 
2011.03 2011.01.09D17:17:00.000000000| 12.655  12.6575 12.6525 12.655 
2011.03 2011.01.09D17:18:00.000000000| 12.655  12.6575 12.655  12.6575
2011.03 2011.01.09D17:19:00.000000000| 12.6575 12.6575 12.655  12.655 
..
```
