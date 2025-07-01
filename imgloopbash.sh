for file in IMG_*.heic; do
    heif-convert "$file" "${file%.heic}.jpg"
done
