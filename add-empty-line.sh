
find . -type f -name "*.agda" | while read -r file; do
    # Checks the last two bytes of the file
    last_two_bytes=$(tail -c 2 "$file" | od -An -t x1 | tr -d ' ')
    
    if [ "$last_two_bytes" = "0a0a" ]; then
        # Already ends with an empty line (two newline bytes)
        echo "File already has an empty line at the end: $file"
    elif [ "${last_two_bytes: -2}" = "0a" ]; then
        # Ends with a newline, but not an empty line
        printf '\n' >> "$file"
        echo "Added an empty line to the end of: $file"
    else
        # Does not end with a newline
        printf '\n\n' >> "$file"
        echo "Added two new lines to the end of: $file"
    fi
done

