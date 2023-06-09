#! /bin/bash
echo "命令行参数数量：" $#
echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2
echo '$3 = ' $3

increase_cout()
{
	# cout=${cout+1} 这样有问题
	cout=$((cout+1))
}

# 1. 第 2 种的缩写形式
echo
cout=0
for xxxx
do
	echo 'default' "($cout)" $xxxx
	increase_cout
done

# 2.
echo
cout=0
for xxxx in "$@"
do
	echo '"$@":' "($cout)" $xxxx
	increase_cout
done

# 3.
echo
cout=0
for xxxx in $@
do
	echo '$@:  ' "($cout)" $xxxx
	increase_cout
done


# 4.
echo
cout=0
for xxxx in "$*"
do
	echo '"$*":' "($cout)" $xxxx
	increase_cout
done

# 5.
echo
cout=0
for xxxx in $*
do
	echo '$*:  ' "(${cout})" $xxxx
	increase_cout
done
