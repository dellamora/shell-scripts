find . -type f -name "*.agda" | while read -r file; do
    # Use sed to replace the arrows in each .agda file
    sed -i '''s/→/->/g;' "$file"
    echo "Processed: $file"
done
