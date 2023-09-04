#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

show_ip_address() {
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1
}

show_requested_page() {
    awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1
}

show_requests() {
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr
}

not_found_pages() {
    awk '($9 == 404) {print $7}' "$LOG_FILE" | sort | uniq
}

requests_time() {
    awk -F '[: ]' '{print $4}' "$LOG_FILE" | cut -d: -f1-2 | sort | uniq -c | sort -nr | head -n 1
}

show_bots() {
    awk -F'"' '{print $6, $1}' "$LOG_FILE" | grep -i 'bot\|crawl\|spider' | sort | uniq
}

case "$1" in
    1)
        show_ip_address
        ;;
    2)
        show_requested_page
        ;;
    3)
        show_requests
        ;;
    4)
        not_found_pages
        ;;
    5)
        requests_time
        ;;
    6)
        show_bots
        ;;
    *)
        echo "Usage: $0 [1|2|3|4|5|6]"
        echo "1: Most popular requests"
        echo "2: Most requested page"
        echo "3: Requests from  IP's"
        echo "4: Not found pages"
        echo "5: Time of requests"
        echo "6: Show bots"
        ;;
esac
