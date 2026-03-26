#!/bin/bash

# Change this to the directory you want to scan
SEARCH_DIR="path/to/directory"

# Output CSV file
OUTPUT_FILE="path/to/output/location/file_info.csv"

# Write CSV header
echo "\"Path\",\"Size (bytes)\",\"Creation Date\",\"MD5 Checksum\"" > "$OUTPUT_FILE"

# Find files and generate CSV
find "$SEARCH_DIR" -type f | while read -r file; do
  size=$(stat -f "%z" "$file")
  created="=\"$(stat -f "%SB" -t "%Y-%m-%d" "$file")\""
  checksum=$(md5 -q "$file")
  echo "\"$file\",\"$size\",$created,\"$checksum\""
done >> "$OUTPUT_FILE"



