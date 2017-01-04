file="BunpoMatome.txt"
if [ "$file" = "" ]; then
    echo "Error: need param"
    exit
fi
lines=$(wc -l $file | awk '{print $1}')
read -p "y/n:" yn
if [ "$yn" = "y" ]; then
    for((i=2;i<=$lines;i++)); do
        cat $file | head -n $i | tail -n 1 | awk '{print $2}'
        read -s
        cat $file | head -n $i | tail -n 1 | awk '{print $3,$4}'
    done
else
    while true; do
        r=$(expr $RANDOM % $lines)
        cat $file | head -n $r | tail -n 1 | awk '{print $2}'
        read -s
        cat $file | head -n $r | tail -n 1 | awk '{print $3,$4}'
    done
fi

