import subprocess
import keyboard
import cv2

from PIL import Image, ImageTk
import tkinter as tk
subprocess.call([r"C:/Users/alela/Desktop/UNIVERSITA/AI/LPC_PDDL/LPC_PDDL_GRAFICA/esecutore2Couples.bat"])

# wait = input("Premi un tasto per continuare...")
var_lettura = open("piano2coppie.txt", "r").readlines()
print(var_lettura)


numeric_array = []
image_array = []
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
    'move-husbands-to-dx':9,
    'move-husbands-to-sx':10

}

for string in var_lettura:
    string = string.strip().replace('(', '').replace(')', '')  # rimuove parentesi e newline
    parts = string.split(' ')
    command = parts[0]
    numeric_array.append(mapping[command])

#Aggiunta del 2 alla seconda versione delle mosse
    cont = cont + 1
    print(cont)
    if (cont == 4):
        image_name = command + "-2.png"
        image_array.append(image_name)
    elif(cont == 5):
        image_name = command + "-2.png"
        image_array.append(image_name)
    else:
        image_name = command + ".png"
        image_array.append(image_name)



print(numeric_array)
#Inserisco manualmente immagine iniziale e finale
image_array.insert(0, "startingPoint2Couples.png")
image_array.insert(6,"final-situation.png")
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

    if index < len(image_array) - 1:
        #root.after(750, show_image, index + 1) #questa riga serve per far andare avanti le immagini temporizzate
        root.bind('<space>', lambda event: show_image(index + 1)) #così le immaigni proseguono solo con la barra spazio

# Mostra la prima immagine
show_image(0)

root.mainloop()






