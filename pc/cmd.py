# Command Prompt Mimic using Tkinter

import tkinter as tk
import os
import subprocess

class CommandPromptMimic:
    def __init__(self, master):
        self.master = master
        master.title("Command Prompt Mimic")

        self.text_area = tk.Text(master, wrap='word', height=20, width=80)
        self.text_area.pack()

        self.entry = tk.Entry(master, width=80)
        self.entry.pack()
        self.entry.bind('<Return>', self.execute_command)

    def execute_command(self, event):
        command = self.entry.get()
        self.entry.delete(0, tk.END)
        self.text_area.insert(tk.END, f"> {command}\n")
        try:
            output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)
            self.text_area.insert(tk.END, output)
        except subprocess.CalledProcessError as e:
            self.text_area.insert(tk.END, e.output)

if __name__ == "__main__":
    root = tk.Tk()
    command_prompt = CommandPromptMimic(root)
    root.mainloop()
