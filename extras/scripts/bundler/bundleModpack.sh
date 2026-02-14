MOD_ROOT="../../.."
ZIP_NAME="FunkinRemnants.zip"
EXCLUDE_LIST="modpackExcludeList.txt"

rm -fr modpack

(find "$MOD_ROOT" -type f | grep -v -f "$EXCLUDE_LIST") | while read -r file; do
  modpackFile="modpack/${file#$MOD_ROOT/}"
  echo "$modpackFile"

  mkdir -p "$(dirname "$modpackFile")"
  cp "$file" "$modpackFile"
done

if command -v 7z > /dev/null 2>&1
then
  rm FunkinRemnants.zip
  7z a -tzip "$ZIP_NAME" ./modpack/*
  rm -fr modpack

  echo "Done! The modpack is contained in $ZIP_NAME."
else
  echo "7z is not installed! Cannot bundle the modpack into a zip automatically."
  echo "Done! The modpack is contained in the modpack folder."
fi