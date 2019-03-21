#!/usr/bin/env bash

#  pipreqs.sh


#~~DESCRIPTION~~#
#  pipreqs.sh is a bash wrapper around pipreqs, a python tool
#  tool that generates a requirements.txt file containing 
#  module dependencies in a project. However, pipreqs does not
#  support dependencies in jupyter notebooks (yet). Thus, this
#  script finds and converts all jupyter notebooks into 
#  temporary python scripts to get dependency info.


#  Find all ipython notebooks by extension
notebooks=$(find . -type f -name "*.ipynb")

