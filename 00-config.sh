log() {
	_msg="${1:?no msg to log}"
	_key='--'
	printf ' %s %s\n' "$_key" "$_msg"
}

list() {
	_src="${1:?no src to list}"
	rsync --list-only -- "$_src"
}

download() {
	_src="${1:?no src to download}"
	_out="${2:-.}"

	rsync --human-readable --partial --progress --compress-choice=zstd --whole-file --copy-links --verbose -- "$_src" "$_out"
}
