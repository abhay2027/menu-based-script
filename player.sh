#!/bin/sh
MEDIA_DIR="$HOME/Music"
PLAYER="mplayer"

files=$(find "$MEDIA_DIR" -maxdepth 1 -type f \( -iname "*.mp3" -o -iname "*.mp4" -o -iname "*.mkv" \) | sort)

if [ -z "$files" ]; then
    echo "No media files found in $MEDIA_DIR"
    exit 1
fi

echo "Select a file to play:"
echo

i=1
file_array=()
while IFS= read -r f; do
    file_array+=("$f")
    echo "$i) $(basename "$f")"
    i=$((i + 1))
done <<EOF
$files
EOF

echo
printf "Enter choice number: "
read choice

if ! echo "$choice" | grep -Eq '^[0-9]+$'; then
    echo "Invalid input."
    exit 1
fi

count=${#file_array[@]}
if [ "$choice" -lt 1 ] || [ "$choice" -gt "$count" ]; then
    echo "Invalid choice."
    exit 1
fi

selected="${file_array[$((choice-1))]}"
"$PLAYER" "$selected"
