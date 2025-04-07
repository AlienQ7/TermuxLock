#!/bin/bash
./signup.sh
echo
espeak -v en+f4 -s 143 -p 48 " Enter your user name"
read -p $'\e[1;36m  Enter Username :\e[0m ' username
echo
echo
espeak -v en+f4 -s 143 -p 48 " Enter your password"
read -p $'\e[1;36m  Enter Password :\e[0m ' password
echo
echo
espeak -v en+f4 -s 143 -p 48 " Enter Your Command Prompt Name"
read -p $'\033[1m\033[34m  Your \033[34mDisplay \033[1;94mName \033[35m  : \033[31m\033[1m ' names
espeak -v en+f4 -s 143 -p 48 " Restart the app"
cd
cd ..
cd usr/etc
rm motd
rm bash.bashrc
cat <<LOGIN>bash.bashrc

trap '' 2
cd $HOME
cd TermuxLock
python3 motd1.py
echo
espeak -v en+f4 -s 138 -p 48 " Enter your.. username."
read -p $'\e[33m\033[1m\033[35m[\033[32mENTER\033[35m]\033[31mINPUT ⟩ \033[31mUSERNAME ⟩\033[34m ' user
echo
espeak -v en+f4 -s 138 -p 48 " Enter your.. passwod."
echo
read -s -p $'\e[32m\033[1m\033[35m[\033[32mENTER\033[35m]\033[31mINPUT ⟩ \033[31mPASSWORD ⟩\033[34m ' pass
if [[ \$pass == $password && \$user == $username ]]; then
sleep 0.5
clear
cd $HOME
cd TermuxLock
python3 loading.py
clear
cd $HOME
cd TermuxLock
python3 Banner.py
PS1='
\[\e[1;31m\]    ┌─\[\e[1;31m\]《\[\e[1;34m\]$names\[\e[1;31m\]》\[\e[1;32m\]─⟨\[\e[31m\]\#\[\e[1;32m\]⟩\[\e[1;37m\]
 【Hacker】 \[\e[1;31m\]
    └─ ⟨\[\e[38;5;226m\]\w\[\e[1;31m\]⟩\[\e[1;34m\]≺─⟨\[\a\]\[\e[31m\]'
espeak -v en+f4 -s 143 -p 48 " Login Succesfull."
cd $HOME
cd TermuxLock
./auto_update.sh

cd $HOME
else
echo
echo
echo -e "\e[1;31m\t⟨ Incorrect Credentials ⟩\e[0m"
espeak -v en+f4 -s 140 -p 48 "Incorrect. Password. Or. Incorrect. Username!!"
sleep 0.2
cmatrix -L -x -C red

fi
trap 2
LOGIN
echo
echo
echo
