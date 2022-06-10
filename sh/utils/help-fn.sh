# $1 command
# check if command exists
# eg. 
# if check_command "curl"; then
# fi
# 
check_command() {
  type "$1" > /dev/null 2>&1
}


# $1 tips
# $2 default value
# @return $value
# eg. get_user_input "Please input your name:" "Tom"
get_user_input() {
    read -p "$1 ($2) " value
    value=${value:=$2}
}

# $1 file path
# $2 match string
# @return $count
# eg. file_contains ~/.ssh/config "127.0.0.1"
file_contains() {
    count=0
    while read myline; do
        if [[ $myline =~ $2 ]]; then
            count=$(($count + 1))
        fi
    done <$1
    if [ $count -eq 0 ]; then
        check_command xxxx
    fi
}

echo "loading help-fn.sh success !"
