#!/bin/bash
# Check for internet connection
if ! curl -sf -m 5 'http://1.1.1.1' > /dev/null; then
  text="⟨ YOUR OFFLINE,SKIPPING UPDATES ⟩"
  echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
  espeak -v en+whisper -s 155 -p 35 -g 5 " Your offline,..skipping updates"
  exit
fi

# Online, proceed with updates
text="⟨ AUTOMATICALLY UPDATING...!! ⟩"
echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
espeak -v en+whisper -s 155 -p 35 -g 5 " automatically updating,please wait"
echo -e "\n"
sleep 0.5
apt update


text="D0 YOU WANT TO UPGRADE? \033[32m(y/n)"
echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
espeak -v en+whisper -s 155 -p 35 -g 5 " Do you want to upgrade?"
while true; do
  read -e -p $'\n\e[32mINPUT===⟩ \e[0m' input
  # Convert the input to lowercase for easier comparison
  case "${input,,}" in
    y|yes)
      apt upgrade
      echo -e "\n"
      break # Exit the loop after successful upgrade
      ;;
    n|no)
      echo -e "\n\033[1;33mUpgrade skipped.\033[0m\n"
      break 
      ;;
    *)
      # Any other input falls here
      text_error="Enter valid input (y/n)"
      echo -e "\n\033[1;31m$(printf "%*s" $(( $(tput cols) / 2 + ${#text_error}/2 )) "$text_error")\033[0m"
      espeak -v en+whisper -s 155 -p 35 -g 5 " Enter valid input."
      ;;
  esac
done

