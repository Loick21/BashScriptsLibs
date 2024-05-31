function choose_from_options(){
  local menu=($@) curr_idx=0 nb_options=${#menu[@]}
  while :
  do
    index=0
    for item in ${menu[@]}; 
    do
      if [ $curr_idx -eq $index ]
      then 
        echo -e "-> $item"
      else
        echo -e "   $item"
      fi
      index=$(($index + 1))
    done
    
    read -rs -n3 key
   
    case $key in
       $'\e[A')
        curr_idx=$(($curr_idx - 1))
	[ $curr_idx -lt 0 ] && curr_idx=0
       ;;
       $'\e[B') 
        curr_idx=$((curr_idx + 1))
        [ $curr_idx -ge $(($nb_options - 1)) ] && curr_idx=$(($nb_options - 1))
       ;;
       $'') break;;
       *) curr_idx=$curr_idx;; 
    esac
    echo -en "\e[${nb_options}A"
  done
  selected_option=${menu[curr_idx]}
}
