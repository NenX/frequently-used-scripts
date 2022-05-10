# param1 text

echoBlue()
{
    echo -e "\033[46;37m $1 \033[0m"
}
echoYellow()
{
   echo -e "\033[43;37m $1 \033[0m" 
}
echoRed()
{
    echo -e "\033[41;37m $1 \033[0m" 
}
echoGreen()
{
    echo -e "\033[42;37m $1 \033[0m" 
}
echo "loading echoColor.sh success !"