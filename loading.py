import time
import sys
import os
import re

def remove_color_codes(text):
    return re.sub(r'\x1b\[([0-?]*[ -/]*[@-~])', '', text)

def center_text(text):
    width = os.get_terminal_size().columns
    text_len = len(remove_color_codes(text))
    return " " * int((width - text_len) / 2) + text

for i in range(101):
    bar = "█" * int((i / 100) * (os.get_terminal_size().columns - 20))
    space = "░" * (os.get_terminal_size().columns - 20 - len(bar))
    loading = center_text('\033[31m░█░░░█▀█░█▀█░█▀▄░▀█▀░█▀█░█▀▀')
    loading1 = center_text('░█░░░█░█░█▀█░█░█░░█░░█░█░█░█')
    loading2 = center_text('░▀▀▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀\033[0m')
    progress1 = center_text(f'\033[1;34m⟨\033[35m {bar}\033[1;33m{space} \033[1;34m⟩')
    percentage = center_text(f'\033[1;34m⟨\033[1;31m{i}%\033[1;34m⟩')
    progress = f"\n\n\n{loading}\n{loading1}\n{loading2}\n\n{progress1}\n\n{percentage}\n"

    sys.stdout.write("\033[2J\033[H")
    sys.stdout.write(progress)
    sys.stdout.flush()
    time.sleep(0.1)

sys.stdout.write("\033[2J\033[H")
load = center_text("\033[31m░█▀▀░█▀█░█▄█░█▀█░█░░░█▀▀░▀█▀░█▀▀░█▀▄")
load1 = center_text("░█░░░█░█░█░█░█▀▀░█░░░█▀▀░░█░░█▀▀░█░█")
load2 = center_text("░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀░")
sys.stdout.write("\n\n\n\n" + load + "\n" + load1 + "\n" + load2 + "\n")
time.sleep(1)
