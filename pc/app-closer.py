# Open Applications Manager

import tkinter as tk
import psutil
import os

def get_open_applications():
    applications = []
    for proc in psutil.process_iter(['pid', 'name']):
        applications.append(proc.info)
    return applications

def close_application(pid):
    try:
        os.kill(pid, 9)
    except Exception as e:
        print(f"Error closing application: {e}")

def refresh_applications():
    for widget in frame.winfo_children():
        widget.destroy()
    for app in get_open_applications():
        app_button = tk.Button(frame, text=app['name'], command=lambda pid=app['pid']: close_application(pid))
        app_button.pack()

root = tk.Tk()
root.title("Open Applications Manager")
root.geometry("300x400+1000+0")  # Positioning at top-right

frame = tk.Frame(root)
frame.pack(pady=10)

refresh_button = tk.Button(root, text="Refresh Applications", command=refresh_applications)
refresh_button.pack(pady=10)

refresh_applications()
root.mainloop()
