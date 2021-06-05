set terminal png
set xlabel "zipfian s"

# ARG1 is the csv file
# ARG2 is the output location of p50
# ARG3 is the output location of throughput
# ARG4 is the output location of p99

set ylabel "throughput (tps)"
set title "Throughput v skew, 1 key txns"
set output "CRDBvTherm_1key.png"
plot "dat_1key.csv" using "skews":"ops/sec(cum)" with linespoint title "CockroachDB-POS, n=1 key",\
    "dat_1key_therm_debugged.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopylae, n=1 key"

set title "Throughput v skew, 1 key txns, skewed"
set output "CRDBvTherm_1key_skewed.png"
plot "dat_1key_skewed.csv" using "skews":"ops/sec(cum)" with linespoint title "CockroachDB-POS, n=1 key",\
    "dat_1key_therm_skewed.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopylae, n=1 key"

set title "CRDB baselines throughput v skew, single vs. multikey txns"
set output "CRDBBaselines.png"
plot "dat_1key.csv" using "skews":"ops/sec(cum)" with linespoint title "CRDB-POS, 1 key/txn",\
    "dat_crdb_baseline_2keys.csv" using "skews":"ops/sec(cum)" with linespoint title "CRDB-POS, 2 keys/txn"

set title "Thermopylae throughput v skew, single vs. multikey txns"
set output "ThermopylaeComparisons.png"
plot "dat_1key_therm_debugged.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopylae, 1 key/txn",\
    "dat_thermopylae_2keys_95.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopoylae 2 keys/txn"

set title "Thermopylae v CRDB, 2 keys"
set output "CRDBvTherm_2keys.png"
plot "dat_crdb_baseline_2keys.csv" using "skews":"ops/sec(cum)" with linespoint title "CRDB-POS",\
    "dat_thermopylae_2keys_95.csv" using "skews":"ops/sec(cum)" with linespoint title "Thermopylae"

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
