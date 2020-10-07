set terminal png
set xlabel "throughput (qps)"
set ylabel "p95 (ms)"
set output "network_bandwidth_lt.png"
plot "lt1.csv" using "ops/sec(cum)":"p95(ms)" with linespoint title "1 byte",\
		 "lt10.csv" using "ops/sec(cum)":"p95(ms)" with linespoint title "10 bytes",\
		 "lt100.csv" using "ops/sec(cum)":"p95(ms)" with linespoint title "100 bytes",\
		 "lt1000.csv" using "ops/sec(cum)":"p95(ms)" with linespoint title "1k bytes",\
		 "lt10000.csv" using "ops/sec(cum)":"p95(ms)" with linespoint title "10k bytes"

set title "Throughput vs payload size"
set xlabel "payload size (bytes)"
set ylabel "throughput (qps)"
set output "network_bandwidth_tp_v_payload.png"
set logscale x
plot "data.csv" using "bytes":"ops/sec(cum)" with linespoint notitle
unset logscale x

