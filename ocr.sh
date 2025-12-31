#!/bin/bash
# 1. Usa maim para permitir al usuario seleccionar un área de la pantalla (-s).
#    La imagen capturada se envía directamente a la salida estándar (stdout) en formato PNG.
maim -s | \
# 2. Tesseract lee la imagen desde la entrada estándar (stdin),
#    realiza el OCR usando el idioma español (-l spa),
#    y envía el texto reconocido a la salida estándar (stdout).
tesseract stdin stdout -l spa | \
# 3. xclip toma el texto de la entrada estándar y lo copia al portapapeles del sistema.
xclip -selection clipboard
