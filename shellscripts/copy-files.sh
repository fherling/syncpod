#!/bin/sh

# Source directory to monitor
src_dir=/origin

# Destination directory
dest_dir=/destination
echo "Monitoring $src_dir for new files..."
# Monitor the source directory for new files
inotifywait -m -e create --format '%w%f' "$src_dir" |
while read -r new_file; do
    echo "New file detected: $new_file"
    
    # Wait for file to be completely written by checking if size stabilizes
    prev_size=-1
    current_size=$(stat -s "$new_file" | cut -d' ' -f2 | cut -d= -f2)
    
    echo "Waiting for file to stabilize (initial size: $current_size bytes)"
    
    # Keep checking until size doesn't change
    while [ "$prev_size" != "$current_size" ]; do
        prev_size=$current_size
        echo "Waiting 5 seconds before next check..."
        sleep 5
        current_size=$(stat -s "$new_file" | cut -d' ' -f2 | cut -d= -f2)
        echo "Current size: $current_size bytes"
    done
    
    echo "File size has stabilized at $current_size bytes. Proceeding with copy."
    
    # Extract the base filename (without extension)
    base_name=$(basename "$new_file")

    # Get the current date in the format MMDDYY
    current_date=$(date +%y%m%d)

    # Construct the new filename
    new_filename="${current_date}_${base_name}"

    # Copy the file to the destination directory
    cp -v "$new_file" "$dest_dir/$new_filename"
    echo "File copied successfully to $dest_dir/$new_filename"
done
