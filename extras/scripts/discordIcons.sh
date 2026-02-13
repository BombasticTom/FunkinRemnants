MOD_ROOT="../.."

rm -fr discord-icons
mkdir discord-icons

if command -v ffmpeg > /dev/null 2>&1
then
	find "$MOD_ROOT/images/icons" -name "*.png" -type f | while read -r file; do
    echo "$file"
    ffmpeg -hide_banner -loglevel error -y -i "$file" -pix_fmt rgba -vf "crop=(in_w/2):in_h:0:0, scale=512:512:flags=neighbor" "discord-icons/$(basename -- "$file")"
	done
else
	echo "FFMPEG is not installed! Cannot create discord icons."
fi