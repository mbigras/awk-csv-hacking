BEGIN {
	FS = ","
}
{
	gsub(/"/, "")
	printf "%-8s%-8s%s\n", $1, $2, $3
}
# END{}