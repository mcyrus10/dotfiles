#!/bin/bash
#------------------------------------------------------------------------------
# This is a hacky little script to automate changing the colors in the i3status
# bar; Make sure that the colorscheme has at least 7 colors, i've just been
# copying some vim colorschemes. If you want to change the actual look or
# layout of the bar (other than the colors) modify the .i3status.conf_template
# file
#------------------------------------------------------------------------------

#			====================  colorschemes  ==================== 
despacio=( 		# {{{
"#875f5f" #<-- gray mixed with red
"#ff875f" #<-- pink / orange 
"#949494" #<-- grayish (memory)
"#d7875f" #<-- orange / pink (battery)
"#dfaf87" #<-- beige (volume)
"#d78700" #<-- orange (wireless)
"#5f8787" #<-- bluish gray (load)
"#af875f" #<-- light brown
		) # }}}
sierra=(	# {{{	
"#5f8787" #  Dark_Cyan_Reverse 	
"#d78787" #  Medium_Red 			
"#d78787" #  Medium_Red 			
"#87afaf" #  Medium_Cyan_Reverse 
"#767676" #  Grey_Reverse 		
"#af8787" #  Purple 				
"#b2b2b2" #  Grey 				
"#dfafaf" #  Light_Red 			
"#c6c6c6" #  Silver_Reverse 		
"#afd7d7" #  Cyan 				
) # }}}
alduin=( #  {{{
"#875f5f"
"#878787"
"#878787"
"#87afaf"
"#af5f00"
"#af875f"
"#af8787"
"#dfaf87"
) # }}}
arcadia=( # {{{
"#008787"
"#5f5f87"
"#5f5f87"
"#875f87"
"#875f87"
"#8787af"
"#949494"
"#af8787"
) # }}}
anderson=( # {{{
"#008787"
"#875f87"
"#949494"
"#af8787"

"#628b97"
"#645d59"
"#7bb292"
"#c4c18b"
"#c4c18b"
"#837d7a"
"#88a2a4"
"#363432"
"#be503e"
"#9ad1bc"
"#c5beba"

"#d7ae38"
"#e7c6be"
"#9ad1bc"
"#a8c1c5"
"#bad4f5"
"#be503e"
"#363432"
) # }}}

color_fill(){ sed -i "s/$1/$2/g" $3; }

apply_colorscheme(){
		# Copy the template with the colors to be filled in to a temp file
		cp .i3status.conf_template temp.txt
		# the next two lines are a little hack to pass an array to a function
		colorscheme=$1[@]
		colors=("${!colorscheme}")
		j=0
		for i in ${colors[@]};
		do
			color_fill "__color_${j}__" $i temp.txt
			j=$(( j+1 ))
		done

		mv temp.txt i3status.conf
		}

main() {
		case "$1" in
			"despacio") echo "applying $1 colorscheme" && apply_colorscheme despacio ;;
			"sierra") 	echo "applying $1 colorscheme" && apply_colorscheme sierra ;;
			"anderson") echo "applying $1 colorscheme" && apply_colorscheme anderson ;;
			"alduin") 	echo "applying $1 colorscheme" && apply_colorscheme alduin ;;
			"arcadia") 	echo "applying $1 colorscheme" && apply_colorscheme arcadia ;;
			*) 			echo "$1 not in available colorschemes"
		esac
	}

main $1
