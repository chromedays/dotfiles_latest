scoop export | cut -d' ' -f1 > package_list.txt
# scoop export | cut -d' ' -f3 | tr -d '[]' | sort | uniq > bucket_list.txt