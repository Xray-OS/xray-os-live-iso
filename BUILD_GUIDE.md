# 🛠️ Guía de Compilación de Imágenes ISO de Xray_OS (`build-the-iso.sh`)

Esta guía describe cómo compilar las imágenes ISO de instalación y entorno en vivo para **Xray_OS** usando el script automatizado [`build-scripts/build-the-iso.sh`](./build-scripts/build-the-iso.sh).

---

## 📋 Requisitos Previos

1. **Sistema Operativo**: Arch Linux o derivadas con herramientas de compilación de `archiso`.
2. **Paquetes Requeridos**:
   ```bash
   sudo pacman -S --needed archiso squashfs-tools libisoburn dosfstools e2fsprogs zstd rsync git acl
   ```
3. **Privilegios**: El script debe ejecutarse como **usuario normal** (no con `sudo ./build-the-iso.sh`). El script solicitará permisos de `sudo` de forma segura cuando sea necesario.

---

## 🚀 Sintaxis Básica

```bash
cd /mnt/803910ca-b81c-4ed2-8ae6-9c1fbb26ffea/Development/Xray_OS/xray_os-live-iso/build-scripts
./build-the-iso.sh [OPCIONES]
```

---

## ⚙️ Opciones y Parámetros Disponibles

| Parámetro | Alternativa | Valores Posibles | Valor por Defecto | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| **`-d`** | `--desktop` | `xfce`, `plasma`, `gnome`, `sonicde` | `xfce` | Selecciona el entorno de escritorio base. |
| **`-l`** | `--login-manager` | `sddm`, `plasma-login-manager`, `gdm`, `lightdm`, `sonic-login-manager` | `sddm` | Selecciona el gestor de inicio de sesión gráfico. |
| **`-a`** | `--audio` | `pipewire`, `pulseaudio` | `pipewire` | Selecciona el servidor y subsistema de audio. |
| **`-v`** | `--version` | Texto (ej: `v26.02.16.01`) | `v26.02.16.01` | Define la etiqueta de versión incluida en el nombre de la ISO. |
| | `--iso-name` | Texto (ej: `xray`, `xray-beta`) | `xray` | Prefijo del nombre del archivo `.iso`. |
| | `--xlibre` | *Bandera* | *Desactivado* | Instala y activa paquetes del protocolo de pantalla XLibre. |
| | `--no-xlibre` | *Bandera* | **Activado** | Usa Xorg estándar. |
| | `--chaotic` | *Bandera* | **Activado** | Habilita los repositorios y mirrors de Chaotic-AUR. |
| | `--no-chaotic` | *Bandera* | *Desactivado* | Deshabilita los repositorios de Chaotic-AUR. |
| | `--clean-cache` | *Bandera* | *Desactivado* | Limpia la caché local de pacman antes de empezar la compilación. |
| | `--remove-build`| *Bandera* | *Desactivado* | Elimina automáticamente `/home/vincent/xray-build` al finalizar con éxito. |
| **`-y`** | `--yes`, `--no-confirm` | *Bandera* | *Desactivado* | Modo no interactivo (omite preguntas y temporizadores de espera). |
| **`-h`** | `--help` | *Bandera* | - | Muestra la ayuda de parámetros en terminal. |

---

## 💡 Ejemplos de Compilación

### 1. Compilación XFCE Beta (Estándar Recomendado)
```bash
./build-the-iso.sh -d xfce -l sddm -a pipewire -v v26.02.16.01 --iso-name xray-beta -y
```

### 2. Compilación KDE Plasma
```bash
./build-the-iso.sh -d plasma -l sddm -a pipewire -v v26.02.16.01 --iso-name xray-plasma -y
```

### 3. Compilación GNOME
```bash
./build-the-iso.sh -d gnome -l gdm -a pipewire -v v26.02.16.01 --iso-name xray-gnome -y
```

### 4. Compilación SonicDE
```bash
./build-the-iso.sh -d sonicde -l sddm -a pipewire -v v26.02.16.01 --iso-name xray-sonicde -y
```

### 5. Compilación Limpia (Limpiando caché y borrando temporales al terminar)
```bash
./build-the-iso.sh -d xfce -l sddm -a pipewire --clean-cache --remove-build -y
```

---

## 📁 Directorios y Archivos de Salida

- **Directorio de Trabajo Temporal**: `/home/vincent/xray-build/`
- **Directorio de Artefactos Finales**: `/home/vincent/xray-Out/`

Al terminar la compilación, se generan automáticamente en `/home/vincent/xray-Out/`:
1. `<nombre-iso>.iso` $\rightarrow$ Imagen de instalación booteable (UEFI / BIOS).
2. `<nombre-iso>.iso.sha256` $\rightarrow$ Suma de verificación SHA-256.
3. `<nombre-iso>.iso.md5` $\rightarrow$ Suma de verificación MD5.
4. `<nombre-iso>.iso.sha1` $\rightarrow$ Suma de verificación SHA-1.
5. `<nombre-iso>.iso.pkglist.txt` $\rightarrow$ Manifiesto con la lista exacta y versiones de todos los paquetes instalados en la imagen.

---

## 🔄 Sincronización GitLab ↔ GitHub

Una vez realizados y probados cambios en esta carpeta de `live-iso`, sincroniza con el repositorio de GitHub ejecutando:
```bash
/mnt/803910ca-b81c-4ed2-8ae6-9c1fbb26ffea/Development/Xray_OS/custom-tools/sync-live-iso-repos.sh --commit
```
