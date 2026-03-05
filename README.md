# Professional Nextcloud Automated Installer

![Bash](https://img.shields.io/badge/Bash-5.0+-green?logo=gnubash&logoColor=white)
![GitLab](https://img.shields.io/badge/GitLab-Private--Lab-orange?logo=gitlab)
![License](https://img.shields.io/badge/License-GPL--3.0-red)
![DevSecOps](https://img.shields.io/badge/Workflow-DevSecOps-blue)

Una solución robusta y profesional para el despliegue automatizado de Nextcloud en entornos Ubuntu (Stack LEMP). Este proyecto sigue una arquitectura **Security by Design** y una estrategia de publicación **DevSecOps** que garantiza la separación entre el laboratorio de desarrollo (GitLab) y el portafolio público (GitHub).

## 🎯 Objetivo Técnico

Optimizar el proceso de despliegue de infraestructuras de colaboración privada mediante scripts modulares, validaciones de seguridad y automatización de configuraciones críticas.

## 🛡️ Enfoque Ético y Profesional

Este repositorio ha sido diseñado bajo los estándares más altos de ingeniería de software:
- **Sanitización de Datos**: Todos los componentes sensibles, configuraciones reales y automatizaciones privadas se filtran antes de su publicación.
- **Transparencia**: El código público actúa como una versión demostrativa (pseudocódigo/lógica sanitizada) para portafolio.
- **Calidad**: Integración de linting (`shellcheck`) y pruebas de sintaxis automáticas.

## 🏗️ Arquitectura del Repositorio

La estructura ha sido reorganizada para cumplir con estándares profesionales de escalabilidad:

```
.
├── src/                # Lógica principal del instalador (setup.sh)
├── scripts/            # Scripts DevSecOps y automatización (publish_public.ps1)
├── configs/            # Plantillas de configuración (Sanitizadas)
├── tests/              # Pruebas de validación y CI
├── docs/               # Documentación técnica detallada
├── diagrams/           # Arquitectura visual y diagramas de flujo
└── .gitlab-ci.yml      # Pipeline CI/CD (Entorno privado)
```

## 🚀 Instalación y Acceso

> [!IMPORTANT]
> El repositorio completo con todo el código funcional está disponible en **GitLab** para acceso completo.

https://gitlab.com/group-programming-lab/Nextcloud.git

## 🚀 Instalación y Despliegue

Sigue estos pasos para desplegar el instalador en un entorno Ubuntu limpio:

### Requisitos Previos

- **Sistema Operativo**: Ubuntu 20.04 LTS o superior.
- **Privilegios**: Acceso de superusuario (`sudo`).
- **Conectividad**: Acceso a internet para descarga de paquetes.

### Paso a Paso

1.  **Clonar el Repositorio de Desarrollo**:
    ```bash
    git clone https://gitlab.com/group-programming-lab/Nextcloud.git
    cd Nextcloud
    ```

2.  **Preparar el Script Principal**:
    Asegúrate de que el script de instalación tenga permisos de ejecución:
    ```bash
    chmod +x src/setup.sh
    ```

3.  **Ejecutar el Instalador**:
    Inicia el asistente interactivo con privilegios de root:
    ```bash
    sudo ./src/setup.sh
    ```

### Guía del Asistente Interactivo
El script `src/setup.sh` proporciona un menú profesional para gestionar el despliegue:
*   **[1] Instalar Requisitos**: Automatiza la actualización del sistema e instala el Stack LEMP.
*   **[2] Configurar Nextcloud**: Ejecuta la lógica de vinculación con la base de datos y parámetros de red.
*   **[3] Configurar Seguridad**: Aplica endurecimiento (*hardening*) de permisos en directorios críticos.
*   **[4] Verificar Estado**: Diagnóstico rápido de servicios y recursos del sistema.

## 🔄 Flujo DevSecOps (GitLab ➔ GitHub)

Implementamos una estrategia de **Aislamiento de Seguridad** para proteger la propiedad intelectual y los datos sensibles:

1.  **GitLab (Source of Truth)**: Todo el desarrollo, tests unitarios y CI se ejecutan en el laboratorio privado.
2.  **Validación**: Cada commit debe pasar los linters y tests configurados.
3.  **Sanitización (`publish_public.ps1`)**: Se ejecuta un script que:
    - Purga archivos de CI internos.
    - Elimina configuraciones de producción.
    - Filtra lógica crítica o payloads experimentales.
    - Genera una rama `public` limpia.
4.  **GitHub (Public Version)**: Versión final sanitizada lista para revisión técnica y portafolio.

## 🚀 Script de Publicación: `publish_public.ps1`

El archivo `scripts/publish_public.ps1` es el corazón de nuestra estrategia de seguridad. Automatiza la limpieza del repositorio local antes de realizar un push forzado a la rama principal de GitHub, asegurando que **nunca** se filtren secretos por error humano.

### Componentes Eliminados en Sanitización:
- Directorios de Testing (`tests/`)
- Automatización privada y CI (`.gitlab-ci.yml`)
- Scripts de gestión interna (`scripts/` helper scripts)
- Credenciales y configuraciones reales (`configs/`)

## ⚠️ Advertencias de Uso

Este software se proporciona con fines educativos y profesionales. El autor no se responsabiliza de malas configuraciones en servidores de producción. Se recomienda encarecidamente revisar las plantillas en `configs/` antes de cualquier despliegue.
