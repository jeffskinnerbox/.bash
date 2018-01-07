# ping sweep without nmap
# waits for all pings to complete and returns ip with mac address

# commandline version
# (prefix="192.168.1" && for i in `seq 254`; do (sleep 0.5 && ping -c1 -w1 $prefix.$i &> /dev/null && arp -n | awk ' /'$prefix'.'$i' / { print $1 "\t" $3 } ') & done; wait)

# prefix=$(ip route get 8.8.8.8 | awk '{print $NF; exit}' | ???)
prefix="192.168.1"

# header for ping sweep
echo -e "IP Address\tMAC Address"

# perform ping sweep
for i in `seq 254`;
do
    (sleep 0.5 && ping -c1 -w1 $prefix.$i &> /dev/null && arp -n | awk ' /'$prefix'.'$i' / { print $1 "\t" $3 } ') &
done

# waits for all pings to complete
wait
