# param1 tips
# param2 defaultValue
# eg. getUserInput "Please input your name:" "Tom"
getUserInput()
{
    read -p "$1" value
    value=${value:=$2}
    echo "value is $value"
}
echo "loading utils.sh success !"