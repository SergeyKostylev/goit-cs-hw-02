#!/bin/sh
url_list=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  )

log_file_name="./website_status.log"

touch "$log_file_name"

for url in "${url_list[@]}"; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$url")
    [ "$status_code" -eq 200 ] && status_message="UP" || status_message="DOWN"

    output_result="$(date +"%Y-%m-%d %H:%M:%S")  [${url}] is ${status_message}"
    echo $output_result
    echo "$output_result" >> "$log_file_name"
done