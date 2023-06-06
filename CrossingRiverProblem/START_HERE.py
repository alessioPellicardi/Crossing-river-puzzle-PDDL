import os
import sys
import tkinter as tk
from tkinter import ttk
import subprocess
root = tk.Tk()
root.title('Azure')

window_height = 330
window_width = 800

def center_screen():
    """ gets the coordinates of the center of the screen """
    global screen_height, screen_width, x_cordinate, y_cordinate

    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()
    x_cordinate = int((screen_width/2) - (window_width/2))
    y_cordinate = int((screen_height/2) - (window_height/2))
    root.geometry("{}x{}+{}+{}".format(window_width, window_height, x_cordinate, y_cordinate))

center_screen()


style = ttk.Style(root)
root.tk.call('source', 'azure.tcl')
style.theme_use('azure')

options = ['', 'Select the version you want to start', 'Wolf Cabbage Sheep', 'Jeaolus Husbands: 2 couples','Jealous Husbands: 3 couples']
a = tk.IntVar()
b = tk.IntVar()
b.set(1)
c = tk.IntVar()
d = tk.IntVar()
d.set(2)
e = tk.StringVar()
e.set(options[1])
f = tk.IntVar()
g = tk.IntVar()
g.set(75)
h = tk.IntVar()

menubtn = ttk.OptionMenu(root, e, *options)
menubtn.place(x=300, y=120)
w = tk.Label(root, text="PDDL Representation: Crossing river problem", font=("Arial", 25))
w.place(x=70,y=70)

def callback():
    print('Button callback '+ e.get())
    selected_option = e.get()
    if selected_option == "Wolf Cabbage Sheep":
        os.chdir("./crossing_river_files/WSC/")
        subprocess.call(["python", "WSCGraphics.py"])
        sys.exit()

    elif selected_option == "Jeaolus Husbands: 2 couples":
        os.chdir("./crossing_river_files/2Couples/")
        subprocess.call(["python", "2CouplesGraphics.py"])
        sys.exit()

    elif selected_option == "Jealous Husbands: 3 couples":
        os.chdir("./crossing_river_files/3Couples/")
        subprocess.call(["python", "3CouplesGraphics.py"])
        sys.exit()


accentbutton = ttk.Button(root, text='START', style='Accentbutton', command=callback)
accentbutton.place(x=300, y=170)


root.mainloop()
