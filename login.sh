#!/bin/bash
./logos.sh
echo
espeak -v en+whisper -s 155 -p 99 " Enter your user name"
read -p $'\e[1;36m  Enter Username :\e[0m ' username
echo
echo
espeak -v en+whisper -s 155 -p 99 " Enter your password"
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

# PRE-LOGIN TRAP: Prevents Ctrl+C from closing Termux while on the login prompt.
trap '' 2

cd \$HOME
cd TermuxLock
python3 motd1.py
echo
espeak -v en+whisper -s 155 -p 99 " Enter your.. username."
read -p \$'\e[1;31m ⟩ USERNAME ⟩\033[34m ' user
echo
espeak -v en+whisper -s 155 -p 99 " Enter your.. passwod."
echo
read -s -p \$'\e[1;31m ⟩ PASSWORD ⟩\033[34m ' pass

if [[ \$pass == $password && \$user == $username ]]; then
    
    (
        trap 'exit 0' 2

        sleep 0.5
        clear
        cd \$HOME/TermuxLock
        python3 load.py
        clear
        cd \$HOME/TermuxLock
        python3 ban.py
        espeak -v en+whisper -s 155 -p 99 " Login Succesfull."
        cd \$HOME/TermuxLock
        ./auto_update.sh
        
    ) 
    

    cd \$HOME/TermuxLock
    PS1='
\[\e[1;31m\]    ┌─\[\e[1;31m\]《\[\e[1;34m\]$names\[\e[1;31m\]》\[\e[1;32m\]─⟨\[\e[31m\]\#\[\e[1;32m\]⟩─⟨\[\e[38;5;226m\]\w\[\e[1;32m\]⟩\[\e[1;37m\]
【Hacker】 \[\e[1;31m\]
    └─ ⟨\[\e[1;34m\]≺─⟨\[\e[31m\]'
    # Return user to HOME directory and interactive shell.
    cd \$HOME

else
    echo -e ""
    echo -e ""
    echo -e "\e[1;31m\t⟨ Incorrect Credentials ⟩\e[0m"
    espeak -v en+whisper -s 155 -p 99 "Incorrect. Password. Or. Incorrect. Username!!"
    sleep 0.2
    cmatrix -L -x -C red
fi

# POST-LOGIN TRAP: Re-enable default handling of Ctrl+C for the interactive shell.
trap 2
LOGIN
