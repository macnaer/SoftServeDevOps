#!/bin/bash

show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  --help          Display this help message"
    echo "  --all           Display IP addresses and symbolic names of all hosts in the subnet"
    echo "  --target        Display a list of open system TCP ports"
}

display_all_hosts() {
    echo "List of hosts in the current subnet:"
    arp-scan --localnet
}

display_open_ports() {
    echo "List of open system TCP ports:"
    netstat -antp
}

# Main script
case "$1" in
    --help)
        show_help
        ;;
    --all)
        display_all_hosts
        ;;
    --target)
        display_open_ports
        ;;
    *)
        echo "Invalid option. Use --help for usage information."
        exit 1
        ;;
esac
