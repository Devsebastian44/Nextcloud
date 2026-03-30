# Nextcloud Automated Installer

![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-E95420?style=flat&logo=ubuntu&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Bash_5.0%2B-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Nextcloud](https://img.shields.io/badge/Nextcloud-Self--Hosted-0082C9?style=flat&logo=nextcloud&logoColor=white)
![Nginx](https://img.shields.io/badge/Web_Server-Nginx-009639?style=flat&logo=nginx&logoColor=white)
![MySQL](https://img.shields.io/badge/Database-MySQL%2FMariaDB-4479A1?style=flat&logo=mysql&logoColor=white)
![License](https://img.shields.io/badge/License-GPL--3.0-red?style=flat)

## 🧠 Overview

Este proyecto es un **instalador automatizado de Nextcloud** para entornos Ubuntu, construido íntegramente en Bash. A partir del análisis de la estructura del repositorio y sus archivos clave, el script principal (`src/setup.sh`) orquesta el despliegue completo de un stack **LEMP** (Linux + Nginx + MySQL/MariaDB + PHP) y la configuración de Nextcloud sobre él, a través de un asistente interactivo por menú que guía al administrador en cada etapa del proceso.

El proyecto sigue una estrategia **DevSecOps** con separación explícita entre entorno de desarrollo privado (GitLab) y portafolio público (GitHub), empleando un pipeline de sanitización automatizado (`publish_public.ps1`) que filtra configuraciones reales, credenciales y lógica interna antes de cada publicación pública.

---

## ⚙️ Features

- **Asistente interactivo por menú** — `setup.sh` presenta un menú modular que permite ejecutar cada fase del despliegue de forma independiente o secuencial.
- **Instalación del stack LEMP** — Automatiza la instalación y configuración de Nginx como servidor web, MySQL/MariaDB como base de datos y PHP con las extensiones requeridas por Nextcloud.
- **Despliegue de Nextcloud** — Descarga, descomprime y enlaza Nextcloud al directorio web de Nginx, configurando la base de datos y los parámetros de red del servidor.
- **Hardening de seguridad** — Aplica endurecimiento de permisos en directorios críticos de Nextcloud (`/var/www/nextcloud/`) para cumplir con las recomendaciones de seguridad oficiales.
- **Diagnóstico del sistema** — Opción de verificación de estado que reporta el estado de los servicios activos (Nginx, MySQL, PHP-FPM) y recursos del sistema.
- **Pipeline DevSecOps** — Script `publish_public.ps1` en PowerShell que automatiza la sanitización y publicación del repositorio desde GitLab hacia GitHub, eliminando artefactos sensibles antes de cada push.
- **Documentación técnica separada** — Carpeta `docs/` con documentación detallada del proceso de despliegue, independiente del código fuente.

---

## 🛠️ Tech Stack

| Componente | Tecnología |
|---|---|
| Sistema Operativo | Ubuntu 20.04 LTS o superior |
| Lenguaje de scripting | Bash / Shell |
| Servidor web | Nginx |
| Base de datos | MySQL / MariaDB |
| Lenguaje backend | PHP (con extensiones Nextcloud) |
| Aplicación desplegada | Nextcloud (plataforma self-hosted) |
| Pipeline de sanitización | PowerShell (`publish_public.ps1`) |
| Control de versiones | Git (GitHub + GitLab) |

---

## 📦 Installation

### Requisitos previos

- Ubuntu Server 20.04 LTS o superior
- Acceso de superusuario (`sudo`)
- Conexión a Internet activa
- Al menos **2 GB de RAM** y **10 GB de espacio en disco** (recomendado para Nextcloud)

### Instalación desde GitLab (fuente completa)

```bash
# 1. Clonar el repositorio completo
git clone https://gitlab.com/group-programming-lab/Nextcloud.git
cd Nextcloud

# 2. Otorgar permisos de ejecución al script principal
chmod +x src/setup.sh

# 3. Ejecutar el instalador con privilegios de root
sudo ./src/setup.sh
```

### Instalación desde GitHub (versión pública)

```bash
# 1. Clonar la versión pública del repositorio
git clone https://github.com/devsebastian44/Nextcloud.git
cd Nextcloud

# 2. Otorgar permisos de ejecución
chmod +x src/setup.sh

# 3. Ejecutar el instalador
sudo ./src/setup.sh
```

> ⚠️ Se recomienda ejecutar el instalador sobre un servidor limpio o una máquina virtual dedicada. No ejecutar sobre sistemas con servicios web ya configurados sin revisar previamente los archivos de configuración en `configs/`.

---

## ▶️ Usage

Al ejecutar `sudo ./src/setup.sh`, se presenta un menú interactivo con las siguientes opciones:

```
╔══════════════════════════════════════╗
║   Nextcloud Professional Installer  ║
╠══════════════════════════════════════╣
║  [1] Instalar Requisitos             ║
║  [2] Configurar Nextcloud            ║
║  [3] Configurar Seguridad            ║
║  [4] Verificar Estado                ║
║  [0] Salir                           ║
╚══════════════════════════════════════╝
```

**Flujo recomendado de ejecución:**

```bash
# Paso 1 — Instalar el stack LEMP (Nginx, MySQL, PHP)
Seleccionar opción [1]

# Paso 2 — Desplegar y vincular Nextcloud con la base de datos
Seleccionar opción [2]

# Paso 3 — Aplicar hardening de permisos y configuración de seguridad
Seleccionar opción [3]

# Paso 4 — Verificar que todos los servicios estén activos
Seleccionar opción [4]
```

**Verificación manual post-instalación:**

```bash
# Estado de Nginx
sudo systemctl status nginx

# Estado de MySQL/MariaDB
sudo systemctl status mysql

# Estado de PHP-FPM
sudo systemctl status php*-fpm

# Acceder a Nextcloud desde el navegador
http://<IP_DEL_SERVIDOR>/nextcloud
```

---

## 📁 Project Structure

```
Nextcloud/
│
├── src/
│   └── setup.sh                   # Script principal del instalador:
│                                  # menú interactivo, instalación LEMP,
│                                  # despliegue y configuración de Nextcloud
│
├── docs/                          # Documentación técnica detallada:
│                                  # guías de configuración, diagramas
│                                  # de arquitectura y flujos de despliegue
│
├── .gitignore                     # Exclusiones de Git: archivos de entorno,
│                                  # configs reales y artefactos privados
│
├── LICENSE                        # Licencia GPL-3.0
└── README.md                      # Documentación pública del repositorio
```

> 📌 La versión completa en GitLab incluye adicionalmente: `configs/` (plantillas de configuración), `tests/` (validaciones y CI), `scripts/publish_public.ps1` (pipeline de sanitización) y `.gitlab-ci.yml` (pipeline CI/CD privado).

---

## 🔐 Security

Este proyecto despliega una plataforma de colaboración privada. Se consideran las siguientes implicaciones de seguridad:

- **Hardening de permisos** — El script aplica restricciones de propiedad y permisos sobre los directorios de Nextcloud (`www-data`, `750/640`) para limitar la exposición de archivos sensibles.
- **Separación de credenciales** — Las configuraciones reales de base de datos y parámetros de red son filtradas por el pipeline de sanitización antes de la publicación pública; nunca deben commitearse credenciales reales.
- **Nginx como proxy seguro** — Se recomienda configurar HTTPS con certificado SSL/TLS (Let's Encrypt o autofirmado) sobre Nginx antes de exponer Nextcloud a redes públicas.
- **PHP hardening** — Verificar que `php.ini` tenga deshabilitadas directivas como `expose_php`, `display_errors` y configurados límites de subida adecuados (`upload_max_filesize`, `post_max_size`).
- **MySQL/MariaDB** — Ejecutar `mysql_secure_installation` tras la instalación para eliminar usuarios anónimos, deshabilitar el acceso root remoto y eliminar bases de datos de prueba.
- **Firewall** — Se recomienda configurar `ufw` para permitir únicamente los puertos necesarios (80, 443) y bloquear accesos directos al puerto de base de datos (3306).
- **Uso responsable** — Este proyecto está diseñado para **entornos educativos, laboratorios y despliegues controlados**. Revisar y adaptar todos los archivos de configuración antes de cualquier uso en producción.

> ⚠️ El código público en GitHub es una versión sanitizada. Para el despliegue completo y funcional, utilizar el repositorio de GitLab.

---

## 🌐 Repository Architecture

Este proyecto sigue una arquitectura distribuida con separación de ambientes:

- **GitHub** — Versión pública sanitizada: documentación, portafolio técnico y referencia del proyecto
- **GitLab** — Fuente de verdad: implementación completa, pipeline CI/CD, tests, configuraciones y laboratorio de desarrollo privado

### Pipeline DevSecOps (GitLab → GitHub)

```
[GitLab - Source of Truth]
       │
       ▼
[Validación: shellcheck + linting]
       │
       ▼
[publish_public.ps1 — Sanitización]
  · Elimina configs reales
  · Filtra credenciales
  · Purga tests y CI internos
  · Genera rama `public` limpia
       │
       ▼
[GitHub - Versión Pública]
```

### 🔗 Full Source Code

👉 Código completo disponible en GitLab: [https://gitlab.com/group-programming-lab/Nextcloud](https://gitlab.com/group-programming-lab/Nextcloud)

---

## 🚀 Roadmap

Posibles mejoras identificadas a partir del análisis del código y la arquitectura actual:

- [ ] **Soporte HTTPS automático** — Integrar Certbot con Let's Encrypt directamente desde el menú del instalador.
- [ ] **Selección de versión de Nextcloud** — Permitir al usuario especificar la versión a instalar en lugar de usar siempre la más reciente.
- [ ] **Soporte para MariaDB y PostgreSQL** — Ampliar la opción de base de datos más allá de MySQL.
- [ ] **Modo headless / no interactivo** — Añadir soporte para flags de línea de comandos que permitan ejecución automatizada sin menú (útil para CI/CD).
- [ ] **Integración con Redis** — Configurar Redis como caché de sesiones y archivos para mejorar el rendimiento de Nextcloud.
- [ ] **Script de backup automatizado** — Añadir un módulo de respaldo para datos de Nextcloud y la base de datos.
- [ ] **Soporte multi-distro** — Extender compatibilidad a Debian y CentOS/Rocky Linux además de Ubuntu.

---

## 📄 License

Este proyecto está bajo la licencia **GNU General Public License v3.0 (GPL-3.0)**.

```
GPL-3.0 License — Copyright (c) devsebastian44
Se permite el uso, modificación y distribución bajo los términos de la GPL v3.
Las versiones derivadas deben mantener la misma licencia y publicar el código fuente.
```

---

## 👨‍💻 Author

**Sebastian**
[GitHub: @devsebastian44](https://github.com/devsebastian44)

> Proyecto desarrollado con fines educativos y de automatización de infraestructura,
> siguiendo principios DevSecOps para el despliegue seguro de plataformas self-hosted.