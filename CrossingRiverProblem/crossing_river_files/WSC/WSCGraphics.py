import subprocess
import cv2

from PIL import Image, ImageTk
import tkinter as tk
subprocess.call([r'WSC_executor.bat'])

# wait = input("Premi un tasto per continuare...")
var_lettura = open("plan.txt", "r").readlines()
print(var_lettura)


numeric_array = []
image_array = []
mapping = {
    'trasporta-pecora-destra': 1,
    'empty-going-left': 2,
    'trasporta-lupo-destra': 3,
    'trasporta-pecora-sinistra': 4,
    'trasporta-cavolo-destra': 5
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


root = tk.Tk()

# Crea un Label per visualizzare le immagini
image_label = tk.Label(root)
image_label.pack()

# Crea una lista per mantenere i riferimenti alle istanze di PhotoImage
photo_array = []

def show_image(index):
    # Carica l'immagine corrispondente all'indice
    photo = tk.PhotoImage(file=image_array[index])
    photo_array.append(photo)  # Aggiunge il riferimento all'array

    image_label.config(image=photo)

    # Se non siamo all'ultima immagine, aspetta 750ms e mostra la prossima immagine
    if index < len(image_array) - 1:
        root.after(750, show_image, index + 1)

# Mostra la prima immagine
show_image(0)

root.mainloop()






