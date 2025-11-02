#!/bin/sh

MEDIA_DIR="$HOME/Music"
PLAYER="mplayer"

files=$(ls "$MEDIA_DIR"/*.mp3 "$MEDIA_DIR"/*.mp4 "$MEDIA_DIR"/*.mkv 2>/dev/null)

if [ -z "$files" ]; then
    echo "No media files found in $MEDIA_DIR"
    exit 1
fi

echo "Select a file to play:"
echo

i=1
for f in $files; do
    basename=$(basename "$f")
    echo "$i) $basename"
    i=$((i + 1))
done

echo
printf "Enter choice number: "
read choice

if ! echo "$choice" | grep -Eq '^[0-9]+$'; then
    echo "Invalid input."
    exit 1
fi

count=$(echo "$files" | wc -w)

if [ "$choice" -lt 1 ] || [ "$choice" -gt "$count" ]; then
    echo "Invalid choice."
    exit 1
fi

selected=$(echo "$files" | awk "{if (NR==$choice) print}")

subtitle="${selected%.*}.srt"

echo "Playing: $(basename "$selected")"
if [ -f "$subtitle" ]; then
    echo "Subtitle found: $(basename "$subtitle")"
    "$PLAYER" -sub "$subtitle" "$selected"
else
    "$PLAYER" "$selected"
fi

