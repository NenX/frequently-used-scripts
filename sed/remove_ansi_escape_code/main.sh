test_file=text_with_ansi_escape_code.txt
yellow_text=`echo -e "$(<$test_file)"`

echo -e test1 before: $yellow_text
echo -e test1 after:  $yellow_text | sed -f main_script

echo -e test2 before: $yellow_text
echo -e test2 after:  $yellow_text \
| sed -e 's/yellow/normal/g' -e 's/\x1b\[[0-9;]*[a-zA-Z]//g' # 's/yellow/normal/g;s/\x1b\[[0-9;]*[a-zA-Z]//g'

# echo -e test1 after: $test1_text

