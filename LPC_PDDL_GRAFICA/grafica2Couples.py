import subprocess
import cv2

from PIL import Image, ImageTk
import tkinter as tk
subprocess.call([r"C:/Users/alela/Desktop/UNIVERSITA/AI/LPC_PDDL/LPC_PDDL_GRAFICA/esecutore2Couples.bat"])

# wait = input("Premi un tasto per continuare...")
var_lettura = open("piano2coppie.txt", "r").readlines()
print(var_lettura)


numeric_array = []
image_array = []
mapping = {
    'move-wives-to-dx': 1,
    'move-wives-to-sx': 2,
    'move-wife-to-dx': 3,
    'move-husband-to-dx': 4,
    'move-husband-to-sx': 5,
    'move-couple-to-dx': 6,
    'move-couple-to-sx': 7,
    'move-wife-to-sx': 8,
    'move-husbands-to-dx':9,
    'move-husbands-to-sx':10

}

for string in var_lettura:
    string = string.strip().replace('(', '').replace(')', '')  # rimuove parentesi e newline
    parts = string.split(' ')
    command = parts[0]
    numeric_array.append(mapping[command])
    image_name = command + ".png"
    image_array.append(image_name)

print(numeric_array)
print(image_array)
#
#
# root = tk.Tk()
#
# # Crea un Label per visualizzare le immagini
# image_label = tk.Label(root)
# image_label.pack()
#
# # Crea una lista per mantenere i riferimenti alle istanze di PhotoImage
# photo_array = []
#
# def show_image(index):
#     # Carica l'immagine corrispondente all'indice
#     photo = tk.PhotoImage(file=image_array[index])
#     photo_array.append(photo)  # Aggiunge il riferimento all'array
#
#     image_label.config(image=photo)
#
#     # Se non siamo all'ultima immagine, aspetta 750ms e mostra la prossima immagine
#     if index < len(image_array) - 1:
#         root.after(750, show_image, index + 1)
#
# # Mostra la prima immagine
# show_image(0)
#
# root.mainloop()
#





