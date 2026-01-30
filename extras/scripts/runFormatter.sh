MOD_ROOT="../.."

if command -v haxelib > /dev/null 2>&1
then
	find "$MOD_ROOT" -name "*.hxc" -type f | while read -r file; do
		echo "$file"
		formattedContent=$(cat "$file" | haxelib run formatter --stdin -s "$MOD_ROOT")
		printf "%s\n" "$formattedContent" > "$file"
	done
else
	echo "Haxe is not installed! Script files cannot be formatted."
fi

if command -v npx > /dev/null 2>&1
then
	npm --global install prettier
	npx prettier --write "$MOD_ROOT/**/*.json" --config "$MOD_ROOT/.prettierrc.js"
else
	echo "Node.JS is not installed! JSON files cannot be formatted."
fi