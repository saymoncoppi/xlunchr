#! /bin/bash 
declare iconsfolder=($(ls -a /usr/share/icons/ | sed -e 's/\.//g' | sed '/^\s*$/d'| sed 's/default//g'| cat ))  # name w spaces cause bug, removed from the list
declare -A avaliable_theme
for (( folder=0; folder!=${#iconsfolder[@]}; folder++ ))
do  
icon_theme_index_file=/usr/share/icons/${iconsfolder[folder]}/index.theme

if [ -f "$icon_theme_index_file" ]; then
	is_valid=$(cat $icon_theme_index_file | grep "Size=16")
	if [ "$is_valid" != "" ]; then	
		avaliable_theme[$folder]="${iconsfolder[folder]}"
	fi
fi
done
PS3='Please enter your choice: '
select opt in "${avaliable_theme[@]}"
do
    case $opt in
        "${avaliable_theme[0]}")
            echo "you chose choice 1"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
