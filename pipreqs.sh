#!/usr/bin/env bash

#  pipreqs.sh


#~~DESCRIPTION~~#
#  pipreqs.sh is a bash wrapper around pipreqs, a python tool
#  tool that generates a requirements.txt file containing 
#  module dependencies in a project. However, pipreqs does not
#  support dependencies in jupyter notebooks (yet). Thus, this
#  script finds and converts all jupyter notebooks into 
#  temporary python scripts to get dependency info.

# Provide acticate script
env_dir="./env"
source "$env_dir/bin/activate"

#  Find all ipython notebooks by extension and ignore hits
#  in certain directories
notebooks=$(find ./ -type f -name "*.ipynb" | grep -v "$env_dir" | grep -v "\.\/\.")

mkdir -p "./.tmp"

#  Iterate through python notebooks and make a copy in tmp.
for ipynb_temp in $notebooks
do
	copy_nb=".tmp/copy-$(basename $ipynb_temp)"
	cp "$ipynb_temp" $copy_nb 
	jupyter nbconvert --to script $copy_nb
done

echo Done

# call pipreqs and overwrite into requirements.txt
pipreqs --force "./" 

# Delete tmp folder
rm -rf .tmp
