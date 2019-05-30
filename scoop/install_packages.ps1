$installed_packages = scoop export | cut -d' ' -f1
cat package_list.txt | % { if ($installed_packages -notcontains $_) { scoop install $_ } else { echo "$_ is already installed" } }