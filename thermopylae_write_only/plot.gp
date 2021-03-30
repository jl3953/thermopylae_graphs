set terminal png
set xlabel "zipfian s"

# ARG1 is the csv file
# ARG2 is the output location of p50
# ARG3 is the output location of throughput
# ARG4 is the output location of p99

set ylabel "throughput (tps)"
set title "Throughput v skew (write-only)"
set output "thermopylae_v_crdb_writeonly.png"
plot "thermopylae_writeonly.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopylae",\
    "CRDB_writeonly.csv" using "skews":"ops/sec(cum)" with linespoint title "CRDB"

#set output ARG3
#plot ARG1 using "skews":"ops/sec(cum)" with linespoint notitle
#
#set ylabel "p50 (ms)"
#set title "p50 latency v skew"
#set output ARG2
#plot ARG1 using "skews":"p50(ms)" with linespoint notitle
#
#set ylabel "p99 (ms)"
#set title "p99 latency v skew"
#set output ARG4
#plot ARG1 using "skews":"p99(ms)" with linespoint notitle
