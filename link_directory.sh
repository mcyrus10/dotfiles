#!/bin/bash
#------------------------------------------------------------------------------
# This script is for making symbolic links for an entire directory the function
# link_directory takes an input path to a directory and an output directory. 
# 	e.g.:
#		$ link_directory ${HOME}/.config/i3 i3
# 	Note on recursion:
#		this function does not create directories if they do not exist yet, so
#		if you want foolproof recursion you need to expand what this does, or
#		you can hard code (add the directories yourself)
#------------------------------------------------------------------------------
link_directory(){
				path_base=$(ls -d $1)
				files=$(ls -aR $1)
				for f in ${files[@]};
				do
					echo "linking: ${path_base}/$f  to: $2/$f"
					ln ${path_base}/$f $2/$f
				done
				}

link_directory $1 $2
