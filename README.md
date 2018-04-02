# AWK CSV Hacking

> Hack session with AWK and some CSV data

## Format with awk

```
awk -f fmt.awk some.csv
foo     bar     baz
this    that    quack
```

## Generate some CSV data

```
ruby <<EOF
require 'csv'
arrs = [
	%w(foo bar baz),
	%w(this that quack)
]
CSV.open("some.csv", "wb", force_quotes: true) do |csv|
  arrs.each { |r| csv << r }
end
EOF
cat some.csv
"foo","bar","baz"
"this","that","quack"
```

## Hack session with AWK

```
awk -F , 'NR == 1 { print NF }' some.csv
3
awk -F , 'NR == 1 { printf "%s %s %s\n", $1, $2, $3 }' some.csv
"foo" "bar" "baz"
awk -F , 'NR == 1 {
	gsub(/"/, "")
	printf "%s %s %s\n", $1, $2, $3
}' some.csv
foo bar baz
awk -F , 'NR == 1 {
	gsub(/"/, "")
	printf "%-8s%-8s%s\n", $1, $2, $3
}' some.csv
foo     bar     baz
awk -F , '{
	gsub(/"/, "")
	printf "%-8s%-8s%s\n", $1, $2, $3
}' some.csv
foo     bar     baz
this    that    quack
awk -f fmt.awk some.csv
foo     bar     baz
this    that    quack
```

## Links

* https://stackoverflow.com/questions/17079873/ruby-read-and-write-csv-with-quotes