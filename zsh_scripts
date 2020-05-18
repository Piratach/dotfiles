# moves to previous directory $1 number of times
function cdb() {
	if [ -n "$1" ];
	then
		# check for numbers
		[ "$1" -eq "$1" ] 2>/dev/null || { printf "Not a valid command! :(\n" "$1" >&2; return 1; }
		END="$1"
		for ((i=1;i<=END;i++)); do cd ".."; done 
		ls;
	else
		cd "..";
		ls;
	fi
}

# moves to directory $1 then ls
function cdf() {
	if [ -n "$1" ]
	then
		[[ -d "$1" ]] || { printf "Not a valid directory! :(\n" "$1" >&2; return 1; }
		cd "$1";
		ls;
	else
		cd;
		ls;
	fi
}

# uses the z plugin and then ls
zl() {
	z "$1";
	ls;
}

# git functions
function gitcm() {
	git commit -m "$1"; 
}

# courtesy of github.com/cirrusUK

# Compile and execute a C source on the fly
function csource() {
	[[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s does not exist or is not readable :(\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}

# Compile and execute a C++ source on the fly
function cpsource() {
	[[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s does not exist or is not readable :(\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	g++ "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}
