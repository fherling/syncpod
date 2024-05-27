#!/bin/sh

# Source directory to monitor
src_dir=/origin

# Destination directory
dest_dir=/destination
echo "Monitoring $src_dir for new files..."
# Monitor the source directory for new files
inotifywait -m -e create --format '%w%f' "$src_dir" |
while read -r new_file; do
    # Extract the base filename (without extension)
    base_name=$(basename "$new_file")

    # Get the current date in the format MMDDYY
    current_date=$(date +%m%d%y)

    # Construct the new filename
    new_filename="$current_date_$base_name"

    # Copy the file to the destination directory
    cp -v "$new_file" "$dest_dir/$new_filename"
done
