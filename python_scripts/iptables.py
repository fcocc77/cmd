#!/usr/bin/python

import os

# Borra todas las reglas
os.system("iptables -F")
os.system("iptables -X")

# Bloquea todo el trafico
os.system("iptables -P INPUT DROP")
os.system("iptables -P FORWARD DROP")
os.system("iptables -P OUTPUT DROP")

os.system("iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT")
os.system("iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT")

os.system("iptables -A INPUT -i lo -j ACCEPT")
os.system("iptables -A OUTPUT -o lo -j ACCEPT")
#-------------------------


def rulesRun(ports=None, incoming=None, outgoing=None, tcp=None, udp=None, src=None, dst=None):

    ports = ports.split(",")

    for port in ports:

        if src:
            out_src = " -s "+src
            in_src = " -d "+src
        else:
            in_src = ""
            in_dst = ""
            out_src = ""
            out_dst = ""

        if dst:
            out_dst = " -d "+dst
            in_dst = " -s "+dst
        else:
            in_src = ""
            in_dst = ""
            out_src = ""
            out_dst = ""

        if incoming == 1:

            if tcp == 1:
                cmd = "iptables -A INPUT -p tcp"+in_src+in_dst+" --dport "+port+"  -j ACCEPT"
                os.system(cmd)
                print cmd

            if udp == 1:
                cmd = "iptables -A INPUT -p udp"+in_src+in_dst+" --dport "+port+" -j ACCEPT"
                os.system(cmd)

        if outgoing == 1:
            if tcp == 1:
                cmd = "iptables -A OUTPUT -p tcp"+out_src+out_dst+" --dport "+port+" -j ACCEPT"
                os.system(cmd)

            if udp == 1:
                cmd = "iptables -A OUTPUT -p udp"+out_src+out_dst+" --dport "+port+" -j ACCEPT"
                os.system(cmd)


srcHost = "192.168.10.43"
dstHost1 = "192.168.10.45"

#------------------http------------------------
rulesRun(ports="80", incoming=1, outgoing=1, tcp=1, udp=0)
rulesRun(ports="443", incoming=1, outgoing=1, tcp=1, udp=0)
#----------------------------------------------

#-------------------dns------------------------
rulesRun(ports="53", incoming=0, outgoing=1, tcp=1, udp=1)
#----------------------------------------------

#-------------------ftp------------------------
rulesRun(ports="20:21", incoming=1, outgoing=1, tcp=1, udp=0)
# vim /etc/sysconfig/iptables-config
# IPTABLES_MODULES="ip_conntrack_ftp"
#----------------------------------------------

#-------------------Samba------------------------
rulesRun(ports="137,138,139,445", incoming=1, outgoing=1, tcp=1, udp=1)
#----------------------------------------------

#-------------------SSH------------------------
rulesRun(ports="22", incoming=1, outgoing=1, tcp=1, udp=0)
#----------------------------------------------

#-------------------VNC------------------------
rulesRun(ports="5900", incoming=1, outgoing=1, tcp=1, udp=0)
#----------------------------------------------

#-------------------CatsFarm------------------------
rulesRun(ports="7000:7001", incoming=1, outgoing=1, tcp=1, udp=0)
#----------------------------------------------

#-------------------Houdini License Server------------------------
rulesRun(ports="1714:1715 ", incoming=1, outgoing=1, tcp=1, udp=1)
#----------------------------------------------

#-------------------TheFoundry------------------------
#rulesRun(ports="4101,10000:65535", incoming=True, outgoing=True, tcp=True, udp=True, src=srcHost, dst=dstHost1)
#----------------------------------------------

#-------------------router------------------------
rulesRun(ports="23,28", incoming=1, outgoing=1, tcp=1, udp=1)
#----------------------------------------------

#-------------------mail para django------------------------
rulesRun(ports="587", incoming=1, outgoing=1, tcp=1, udp=1)
#----------------------------------------------


os.system("service iptables save")
