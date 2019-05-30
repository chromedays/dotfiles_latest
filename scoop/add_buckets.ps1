$added_buckets = scoop bucket list
cat bucket_list.txt | % {
    $bucket_name, $bucket_url = $_.split();
    if ($added_buckets -notcontains $bucket_name) { scoop bucket add $bucket_name $bucket_url } else { echo "$bucket_name is already added" }
}