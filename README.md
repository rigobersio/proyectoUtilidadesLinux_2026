# Guía de Herramientas de Productividad para GNU/Linux (XFCE)

Esta guía proporciona instrucciones para configurar tres herramientas de alta eficiencia en un entorno de escritorio XFCE, inspiradas en funcionalidades de Windows 11. El objetivo es crear flujos de trabajo rápidos y accesibles mediante atajos de teclado.

---

## 1. Historial de Portapapeles (Estilo Windows + V)

Esta herramienta te dará un historial consultable de todo lo que copias (texto, imágenes, etc.). Usaremos **CopyQ**.

### Pasos:

1.  **Instalar CopyQ:**
    Abre una terminal y ejecuta el comando correspondiente a tu distribución:
    -   **Debian/Ubuntu/Mint:** `sudo apt install copyq`
    -   **Arch Linux/Manjaro:** `sudo pacman -S copyq`
    -   **Fedora:** `sudo dnf install copyq`

2.  **Configurar Arranque Automático:**
    Para que CopyQ se inicie con tu sistema:
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Sesión e Inicio`.
    -   En la pestaña `Arranque automático de aplicaciones`, haz clic en `Añadir`.
    -   **Nombre:** `CopyQ`
    -   **Comando:** `copyq`
    -   Haz clic en `Aceptar`.

3.  **Asignar Atajo de Teclado:**
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En la pestaña `Atajos de aplicación`, haz clic en `Añadir`.
    -   **Comando:** `copyq toggle`
    -   Haz clic en `Aceptar` y presiona la combinación de teclas que desees (ej. `Super + V`).

---

## 2. Captura de Texto desde Pantalla (OCR)

Este script te permitirá seleccionar un área de la pantalla y copiará instantáneamente cualquier texto dentro de esa área a tu portapapeles.

### Pasos:

1.  **Instalar Dependencias:**
    -   **Debian/Ubuntu/Mint:** `sudo apt install maim tesseract-ocr tesseract-ocr-spa xclip`
    -   **Arch Linux/Manjaro:** `sudo pacman -S maim tesseract tesseract-data-spa xclip`
    -   **Fedora:** `sudo dnf install maim tesseract tesseract-langpack-spa xclip`
    *(El paquete `tesseract-ocr-spa` es para el reconocimiento de texto en español).*

2.  **Crear el Script de OCR:**
    -   Crea un archivo llamado `ocr.sh` en este mismo directorio (`/home/neon/Documents/repos/proyectoUtilidadesLinux_2026/`) con el siguiente contenido:
        ```bash
        #!/bin/bash
        maim -s | tesseract stdin stdout -l spa | xclip -selection clipboard
        ```
    -   Guarda el archivo.

3.  **Hacer el Script Ejecutable:**
    -   En una terminal, navega a este directorio y ejecuta:
        ```bash
        chmod +x ocr.sh
        ```

4.  **Asignar Atajo de Teclado:**
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En `Atajos de aplicación`, pulsa `Añadir`.
    -   **Comando:** `/home/neon/Documents/repos/proyectoUtilidadesLinux_2026/ocr.sh` (asegúrate de que la ruta es correcta).
    -   Pulsa `Aceptar` y asigna una combinación de teclas (ej. `Super + C`).

---

## 3. Selector de Color Global

Esta herramienta te permite hacer clic en cualquier lugar de la pantalla para capturar el código de color de un píxel y copiarlo a tu portapapeles.

### Pasos:

1.  **Instalar Dependencia (`xcolor`):**
    -   **Debian/Ubuntu/Mint:** `sudo apt install xcolor`
    -   **Arch Linux/Manjaro:** `sudo pacman -S xcolor`
    -   **Fedora:** `sudo dnf install xcolor`

2.  **Asignar Atajo de Teclado:**
    No se necesita un script; el comando se puede añadir directamente.
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En `Atajos de aplicación`, pulsa `Añadir`.
    -   Pega el siguiente comando completo:
        ```bash
        xcolor | tr -d '\n' | xclip -selection clipboard
        ```
        *(Nota: `tr -d '\n'` elimina el salto de línea para obtener un código de color limpio).*
    -   Pulsa `Aceptar` y asigna un atajo (ej. `Super + D`).