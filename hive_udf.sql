add file hdfs://nameservice1/user/opt/word_count.py;

--set hive.cli.print.header=true;
set hive.exec.compress.intermediate=true;
set hive.exec.compress.output=true;
set mapred.output.compress.type=BLOCK;
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
--set mapred.child.java.opts="-Xmx526m";
--set mapred.task.timeout=5400000;

select transform (
	main.key,
	main.value
)
row format delimited
fields terminated by '\001'
collection items terminated by '\002'
map keys terminated by '\003'
lines terminated by '\n'
using 'python word_count.py' as (
    word string,
    cnt int 
)
from(
    select key,value
    from test_table
)main
