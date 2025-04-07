#!/bin/bash
# Check for internet connection
if ! curl -sf -m 5 'http://1.1.1.1' > /dev/null; then
  text="⟨ YOUR OFFLINE,SKIPPING UPDATES ⟩"
  echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
  espeak -v en+f4 -s 125 -p 48 " Your offline,..skipping updates"
  exit
fi

# Online, proceed with updates
text="⟨ AUTOMATICALLY UPDATING...!! ⟩"
echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
espeak -v en+f4 -s 130 -p 48 " automatically updating,please wait"
echo -e "\n"
sleep 0.5
apt update
text="D0 YOU WANT TO UPGRADE? \033[32m(y/n)"
echo -e "\n\033[1;32m$(printf "%*s" $(( $(tput cols) / 2 + ${#text}/2 )) "$text")\033[0m"
espeak -v en+f4 -s 130 -p 48 " Do you want to upgrade?"
read -e -p $'\n\e[32mINPUT===⟩ \e[0m' input
if [ "$input" = 'y' ]; then
  apt upgrade
  echo -e "\n"
fi
