#!/bin/bash


# DDOS attacks are malicious system attacks that target network services, these attacks can be prevented by writing a script to tighten Firewall rules or monitoring the traffic flow

# The ipables is used to change iptable setting. The -A will append the settings to a specific rule, Input or output traffic. -p specifies the protocol. -j states if the traffic will be dropped or accepted to come into the system.


1# In this example port 80-http incoming and outgoing traffic is being allowed
iptables -A INPUT -p tcp --destination-port 80 -j ACCEPT
iptables -A OUTPUT -p tcp --destination-port 80 -j ACCEPT

#2 Traffic from port 1433-sql is being accepted
iptables -A INPUT -p tcp --destination-port 1433 -j ACCEPT
iptables -A OUTPUT -p tcp --destinaion-port 1433 -j ACCEPT


#3 Incoming and outgoing port 22-SSH traffic is being dropped
iptables -A INPUT -p tcp --destination-port 22 -j DROP
iptables -A OUTPUT -p tcp --destination-port 22 -j DROP


#5
#-s option specify the targeted ip address
iptables -A INPUT -s 192.168.171.129 -p tcp --destination-port 23 -j DROP

# -m specify the targeted device in this case the physical address. The mac-source specify the targeted address
iptables -A INPUT -m mac --mac-source 00:0c:29:a4:f9:89 -p tcp --destination-port 7 -j DROP


iptables-save > /root/Saving.fw #iptables-save command will save these current iptable rules
iptables-restore < /root/saving.fw #iptables-restore will restore the tables saved in the saving.fw
