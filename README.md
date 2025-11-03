# How to set and customise it ###
## Setting up exactly like mine and using python (python in termux can take 600+ mb) 
### Git clone my repository 
```
git clone https://github.com/AlienQ7/TermuxLock.git
```
then got to TermuxLock directory
```
cd TermuxLock
```
now give permission to the bash scripts
```
chmod +x dependency.sh
chmod +x logos.sh
chmod +x auto_update.sh
```
then run dependency.sh( this will download all the tools needed)
```
bash dependency.sh
```
now lauch the script 
```
bash logos.sh
```
### Remember Don't forget your User name and password !!!!

(voice too you can change or remove )
# Now customising the way you like .
### 1.Its better not to change the logic but only the ban.py(for that cyberhills logo) and motd1.py(system lock display).
### 2. Go make your own logo using ASCII art converter + take AI help 🤣.
(test your art before adding to the logos.sh in next step).
### 3. Save in a file , you change the name like ban.py to anything(but use the correct file type .py or .c  or .sh anything )
### 4.Now go to logos.sh 
```
nano logos.sh
```
and search ban.py or motd1.py(which one your replacing !!)
and change it .
### 5. Re-run the logos.sh
```
bash logos.sh
```

# Note: I used Python as I am know that ,you can use any language to design yours .

