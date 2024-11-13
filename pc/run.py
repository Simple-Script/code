import os

def execute_exe(exe_path):
    if os.path.exists(exe_path):
        os.startfile(exe_path)
        
execute_exe("C:\\path\\to\\your\\executable.exe")
