function print(){
        h=0; m=0; s=0; mp=""; hp=""; sp=""
        if [ $1 -gt 3600 ]; then
                h="$((($1/60/60)))"
                hp="Hours: $h "
        fi
        if [ $1 -gt 60 ]; then
                m="$((($1/60) - ($h*60)))"
                mp="Minuits: $m "
        fi
        s=$(($1 - ($m*60) -($h*60*60)))
        sp="Seconds: $s"
        printf "${hp}${mp}${sp}"
}

function wait(){
i=$1
while [[ $i -ne 0 ]]; do
        print $i
        sleep 1
        printf "\r                           \r"
        ((i-=1))
done
printf "Time over.                     \n"
}

if [[ "$1" == *"m" ]]; then
        wait $((${1::-1}*60))
elif [[ "$1" == *"h" ]]; then
        wait $((${1::-1}*60*60))
else
        wait $1
fi
