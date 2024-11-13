import os

def execute_exe(exe_path):
    if os.path.exists(exe_path):
        os.startfile(exe_path)
    else:
        print("The specified executable does not exist.")

# Example usage
execute_exe("C:\\path\\to\\your\\executable.exe")
