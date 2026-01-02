# Guía de Herramientas de Productividad para GNU/Linux (XFCE)

Esta guía proporciona instrucciones para configurar tres herramientas de alta eficiencia en un entorno de escritorio XFCE, inspiradas en funcionalidades de Windows 11. El objetivo es crear flujos de trabajo rápidos y accesibles mediante atajos de teclado.

---

## 1. Historial de Portapapeles (Estilo Windows + V)

**Nota Importante:** Para que esta funcionalidad esté activa, el programa `copyq` debe estar ejecutándose en segundo plano. Los siguientes pasos no solo lo instalan, sino que también aseguran que se inicie automáticamente con el sistema.

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
    -   **Alternativa:** Si deseas que el script esté disponible globalmente sin especificar la ruta completa, puedes copiarlo a un directorio en tu `$PATH` (como `/usr/bin`).
        ```bash
        sudo cp ocr.sh /usr/bin/ocr.sh
        ```
        *Precaución: Al copiar scripts a `/usr/bin`, asegúrate de que son de confianza y no tienen efectos secundarios no deseados, ya que se ejecutarán con privilegios elevados si los invocas con `sudo` o si el sistema los llama.*

4.  **Asignar Atajo de Teclado:**
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En `Atajos de aplicación`, pulsa `Añadir`.
    -   **Comando:** `/home/neon/Documents/repos/proyectoUtilidadesLinux_2026/ocr.sh` (o `ocr.sh` si lo copiaste a `/usr/bin`).
    -   Pulsa `Aceptar` y asigna una combinación de teclas (ej. `Super + C`).

---

## 3. Selector de Color Global

Esta herramienta te permite hacer clic en cualquier lugar de la pantalla para capturar el código de color de un píxel.

### Opción A: `xcolor` (Scriptable)

Este método es ideal si está disponible en tu sistema, ya que copia el color directamente al portapapeles.

1.  **Instalar `xcolor`:**
    *Nota: El nombre del paquete puede variar. En sistemas Arch, suele ser `xcolor`.*
    -   **Arch Linux/Manjaro:** `sudo pacman -S xcolor`

2.  **Asignar Atajo de Teclado:**
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En `Atajos de aplicación`, pulsa `Añadir`.
    -   Pega el siguiente comando completo:
        ```bash
        xcolor | tr -d '\n' | xclip -selection clipboard
        ```
    -   Pulsa `Aceptar` y asigna un atajo (ej. `Super + D`).

### Opción B (Alternativa Recomendada): `gpick` (Gráfica y Fiable)

Si `xcolor` no está disponible (común en sistemas Debian/Ubuntu), `gpick` es una excelente alternativa gráfica.

1.  **Instalar `gpick`:**
    -   **Debian/Ubuntu/Mint:** `sudo apt install gpick`
    -   **Fedora:** `sudo dnf install gpick`

2.  **Uso:**
    -   Abre `gpick` desde tu menú de aplicaciones.
    -   Aparecerá una pequeña ventana flotante con un ícono de cuentagotas. Haz clic en él.
    -   Tu cursor cambiará. Haz clic en cualquier lugar de la pantalla.
    -   El color se añadirá a la paleta en la ventana principal de `gpick`, donde puedes seleccionar y copiar fácilmente el código hexadecimal.

3.  **Asignar Atajo de Teclado (para abrirlo rápido):**
    -   Ve a `Menú de Aplicaciones` > `Configuración` > `Teclado`.
    -   En `Atajos de aplicación`, pulsa `Añadir`.
    -   **Comando:** `gpick`
    -   Pulsa `Aceptar` y asigna un atajo (ej. `Super + D`). Esto te permitirá lanzar la aplicación instantáneamente.