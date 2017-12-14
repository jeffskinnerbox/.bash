# ping sweep without nmap
# waits for all pings to complete and returns ip with mac address
#(prefix="192.168.1" && for i in `seq 254`; do (sleep 0.5 && ping -c1 -w1 $prefix.$i &> /dev/null && arp -n | awk ' /'$prefix'.'$i' / { print $1 "\t" $3 } ') & done; wait)

# ip route get 8.8.8.8 | awk '{print $NF; exit}'
prefix="192.168.1"

echo -e "IP Address\tMAC Address"
for i in `seq 254`;
do
    sleep 0.5
    ping -c1 -w1 $prefix.$i &> /dev/null && arp -n | \
        awk ' /'$prefix'.'$i' / { print $1 "\t" $3 } '
done
