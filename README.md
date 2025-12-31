# Proyecto: Replicando Herramientas de Productividad en GNU/Linux

## 1. Introducción

Este proyecto tiene como objetivo replicar tres herramientas de alta eficiencia, inspiradas en las funcionalidades de Windows 11, en un entorno de escritorio XFCE en GNU/Linux. El enfoque principal es lograr flujos de trabajo rápidos, basados en atajos de teclado, que minimicen la interrupción y maximicen la productividad. Las herramientas a implementar son: un historial de portapapeles, un sistema de captura de texto desde cualquier parte de la pantalla (OCR) y un selector de color global.

## 2. Objetivos

1.  **Historial de Portapapeles:** Implementar un gestor de portapapeles accesible mediante un atajo de teclado (`Super + V`).
2.  **Captura de Texto (OCR):** Configurar un script que permita seleccionar un área de la pantalla y copie automáticamente el texto contenido en esa área al portapapeles.
3.  **Selector de Color:** Habilitar una herramienta para capturar el código de color (HEX) de cualquier píxel en la pantalla y copiarlo al portapapeles.

## 3. Desarrollo

A continuación se detalla el estado y plan de acción para cada objetivo.

### 3.1. Historial de Portapapeles

*   **Estado:** `Completado`.
*   **Descripción:** Se ha instalado y configurado la aplicación **CopyQ**. Se ha añadido al inicio del sistema y se ha configurado el atajo de teclado `Super + V` para mostrar/ocultar el historial.

### 3.2. Captura de Texto (OCR)

*   **Estado:** `En Progreso`.
*   **Descripción:** Las dependencias (`maim`, `tesseract`, `tesseract-ocr-spa`, `xclip`) ya han sido instaladas.
*   **Pasos restantes:**
    1.  **Crear el script:** Se ha creado un script llamado `ocr.sh` en este mismo directorio. Su contenido es:
        ```bash
        #!/bin/bash
        maim -s | tesseract stdin stdout -l spa | xclip -selection clipboard
        ```
    2.  **Hacerlo ejecutable:** Abre una terminal en este directorio y ejecuta el siguiente comando para dar permisos de ejecución al script:
        ```
        chmod +x ocr.sh
        ```
    3.  **Asignar atajo de teclado:**
        *   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
        *   En la pestaña `Atajos de aplicación`, pulsa `Añadir`.
        *   En `Comando`, introduce la ruta completa al script. Sería: `/home/neon/Documents/ProyectoUtilidadesLinux/ocr.sh`.
        *   Pulsa `Aceptar` y, cuando te lo pida, presiona la combinación de teclas que desees (por ejemplo, `Super + C`).

### 3.3. Selector de Color

*   **Estado:** `Pendiente`.
*   **Plan de acción:**
    1.  **Instalar dependencia:** La herramienta ideal para esto es `xcolor`, es extremadamente ligera. Abre una terminal e instálala:
        *   **Debian/Ubuntu/Mint:** `sudo apt install xcolor`
        *   **Arch Linux/Manjaro:** `sudo pacman -S xcolor`
        *   **Fedora:** `sudo dnf install xcolor`
    2.  **Crear script:** Para que el color se copie directamente al portapapeles, usaremos un pequeño comando. No es necesario crear un archivo de script, se puede poner directamente en el atajo de teclado. El comando es:
        ```bash
        xcolor | tr -d '\n' | xclip -selection clipboard
        ```
        *(`tr -d '\n'` elimina el salto de línea que `xcolor` añade, para tener un código limpio en el portapapeles).*
    3.  **Asignar atajo de teclado:**
        *   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
        *   En `Atajos de aplicación`, pulsa `Añadir`.
        *   Pega el comando completo: `xcolor | tr -d '\n' | xclip -selection clipboard`.
        *   Pulsa `Aceptar` y asigna un atajo (por ejemplo, `Super + D`).
