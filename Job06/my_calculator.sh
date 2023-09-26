if [ "$2" = "+" ]
then
	total=$(expr $1 + $3)
	echo "total = $total"
elif [ "$2" = "-" ]
then
	total=$(expr $1 - $3)
	echo "total = $total"
elif [ "$2" = "*" ]
then
	total=$(( $1 * $3 ))
	echo "total = $total"
elif [ "$2" = "/" ]
then
	total=$(expr $1 / $3)
	echo "total = $total"
fi
