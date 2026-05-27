#!/bin/bash

echo "============================================"
echo "        DNS ENUMERATION TOOL"
echo "============================================"
echo
echo "Choose DNS tool:"
echo "1) nslookup"
echo "2) dig"
echo

read -p "Select option (1 or 2): " TOOL

# Ask for domain
read -p "Enter target domain: " DOMAIN

if [ -z "$DOMAIN" ]; then
    echo "[!] No domain provided. Exiting."
    exit 1
fi

# Ask for DNS server
read -p "Enter DNS server (default: 8.8.8.8): " DNS_SERVER
DNS_SERVER=${DNS_SERVER:-8.8.8.8}

echo
echo "--------------------------------------------"
echo " Target Domain : $DOMAIN"
echo " DNS Server   : $DNS_SERVER"
echo "--------------------------------------------"
echo

# ===============================
# NSLOOKUP MODE
# ===============================
if [ "$TOOL" == "1" ]; then

    echo "NSLOOKUP MODE SELECTED"
    echo
    echo "Choose record type:"
    echo "1) A"
    echo "2) AAAA"
    echo "3) MX"
    echo "4) NS"
    echo "5) SOA"
    echo "6) ALL"
    echo

    read -p "Select option: " RECORD_OPTION

    case $RECORD_OPTION in
        1) RECORD="A" ;;
        2) RECORD="AAAA" ;;
        3) RECORD="MX" ;;
        4) RECORD="NS" ;;
        5) RECORD="SOA" ;;
        6) RECORD="ALL" ;;
        *)
            echo "[!] Invalid option."
            exit 1
            ;;
    esac

    echo
    echo "[+] Running nslookup (interactive mode)"
    echo "--------------------------------------------"

    if [ "$RECORD" == "ALL" ]; then
        nslookup <<EOF
server $DNS_SERVER
set type=A
$DOMAIN
set type=AAAA
$DOMAIN
set type=MX
$DOMAIN
set type=NS
$DOMAIN
set type=SOA
$DOMAIN
exit
EOF
    else
        nslookup <<EOF
server $DNS_SERVER
set type=$RECORD
$DOMAIN
exit
EOF
    fi

# ===============================
# DIG MODE
# ===============================
elif [ "$TOOL" == "2" ]; then

    echo "DIG MODE SELECTED"
    echo

    for TYPE in A AAAA MX NS SOA; do
        echo "[DIG] $TYPE record"
        dig -t $TYPE $DOMAIN @$DNS_SERVER +noall +answer
        echo
    done

else
    echo "[!] Invalid tool selection."
    exit 1
fi

echo "============================================"
echo " DNS ENUMERATION COMPLETE"
echo "============================================"
