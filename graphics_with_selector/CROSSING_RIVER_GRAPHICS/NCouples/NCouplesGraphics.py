import subprocess
import sys

import cv2

from PIL import Image, ImageTk
import tkinter as tk
subprocess.call([r'esecutore3Couples.bat'])

# wait = input("Premi un tasto per continuare...")
var_lettura = open("piano3coppie.txt", "r").readlines()
print(var_lettura)


numeric_array = []
image_array = []
moves_array_temp = []
moves_array = []
cont = 0
mapping = {
    'move-wives-to-dx': 1,
    'move-wives-to-sx': 2,
    'move-wife-to-dx': 3,
    'move-husband-to-dx': 4,
    'move-husband-to-sx': 5,
    'move-couple-to-dx': 6,
    'move-couple-to-sx': 7,
    'move-wife-to-sx': 8,
    'move-husbands-to-dx': 9,
    'move-husbands-to-sx': 10

}

for string in var_lettura:
    string = string.strip().replace('(', '').replace(')', '')  # rimuove parentesi e newline
    parts = string.split(' ')
    command = parts[0]
    numeric_array.append(mapping[command])
    moves_array_temp.append(command)
    image_name = command + ".png"
    image_array.append(image_name)


print(numeric_array)
print(image_array)
for string in moves_array_temp:
    string = string.strip().replace('-', ' ')
    moves_array.append(string)


root = tk.Tk()

# Crea un Label per visualizzare le immagini
image_label = tk.Label(root)
image_label.grid()

# Crea una lista per mantenere i riferimenti alle istanze di PhotoImage
photo_array = []
def close():
   #win.destroy()
   sys.exit()


def open_popup():
    width = 400  # Width
    height = 300  # Height

    screen_width = root.winfo_screenwidth()  # Width of the screen
    screen_height = root.winfo_screenheight()  # Height of the screen

    # Calculate Starting X and Y coordinates for Window
    x = (screen_width / 2) - (width / 2)
    y = (screen_height / 2) - (height / 2)
    top= tk.Toplevel(root)
    top.geometry('%dx%d+%d+%d' % (width, height, x, y))
    top.title("Finish")
    tk.Label(top, text= "Plan execution terminated", font=("Calibri", 14, "bold")).place(x=100,y=80)
    tk.Button(top, text="CLOSE", font=("Calibri", 12), command=close).place(x=180,y=120)


def show_image(index):
    # Carica l'immagine corrispondente all'indice
    photo = tk.PhotoImage(file=image_array[index])
    photo_array.append(photo)  # Aggiunge il riferimento all'array

    image_label.config(image=photo)

    name_label = tk.Label(root, text=moves_array[index], font=("Arial", 25))
    name_label.grid(row=0, column=0, sticky="nw")  # Posiziona in alto a sinistra

    if index < len(image_array) - 1:
        # root.after(750, show_image, index + 1) #questa riga serve per far andare avanti le immagini temporizzate
        root.bind('<space>', lambda event: [name_label.destroy(), show_image(index + 1)])  # così le immaigni proseguono solo con la barra spazio
    else:
        open_popup()

# Mostra la prima immagine
show_image(0)

root.mainloop()






