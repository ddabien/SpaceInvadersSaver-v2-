# Space Invaders Screensaver para macOS 13+

Salvapantallas retro de Space Invaders con estética pixel art auténtica de 8 bits.

**by dr pendejoloco - 2025**

---

## ✅ Compatibilidad Garantizada

✓ **macOS 13.0 Ventura**  
✓ **macOS 14.0 Sonoma**  
✓ **macOS 15.0 Sequoia**  
✓ **macOS 16.0+ Tahoe** y futuras versiones  
✓ **Intel (x86_64)** y **Apple Silicon (M1/M2/M3/M4)**

**Minimum System Version:** macOS 13.0

---

## 🎮 Características

- ✨ Gráficos pixel art auténticos de 8 bits
- 🎵 Efectos de sonido retro de arcade
- 👾 Enemigos alienígenas con animación fluida
- 🛸 OVNI especial con sonido único
- 🛡️ Escudos destructibles
- 💥 Efectos de explosión detallados
- 📺 Scanlines para efecto CRT retro
- 🏷️ **Crédito discreto: "dr pendejoloco"** (esquina inferior izquierda, verde retro)

---

## 📦 Contenido del Paquete

```
SpaceInvaders_LISTO_PARA_SUBIR/
│
├── github-workflows/
│   └── build.yml                    ← GitHub Actions workflow
│
├── SpaceInvadersScreensaver.swift  ← Código fuente (macOS 13+ optimizado)
│
├── SpaceInvadersScreensaver.saver/
│   └── Contents/
│       ├── Info.plist               ← LSMinimumSystemVersion: 13.0
│       ├── MacOS/                   ← (vacío - GitHub lo llena)
│       └── Resources/
│           ├── index.html
│           ├── main.js              ← Con "dr pendejoloco" incluido
│           └── assets/
│               ├── Ship.gif
│               ├── InvaderA.gif
│               ├── InvaderB.gif
│               ├── Explosion.gif
│               ├── GameOver.gif
│               └── DeadShip.gif
│
├── COMO_CREAR_GITHUB_FOLDER.txt    ← ¡LEÉ ESTO PRIMERO!
├── INSTRUCCIONES_COMPLETAS.txt     ← Guía paso a paso
└── README.md                        ← Este archivo
```

---

## 🚀 Instalación con GitHub Actions (RECOMENDADO)

### ⚠️ **PASO 0: Crear la carpeta .github** (CRÍTICO)

**LEÉ EL ARCHIVO:** `COMO_CREAR_GITHUB_FOLDER.txt`

El archivo `build.yml` DEBE estar en `.github/workflows/build.yml`

**Opción más fácil:** Crear manualmente en GitHub después de subir todo:
1. En tu repo → "Add file" → "Create new file"
2. Nombre: `.github/workflows/build.yml`
3. Copiar contenido de `github-workflows/build.yml`
4. Commit

---

### Paso 1: Crear Cuenta en GitHub

1. Ir a: https://github.com/signup
2. Crear cuenta (gratis)
3. Verificar email

---

### Paso 2: Crear Repositorio

1. Click en "New repository"
2. Nombre: `spaceinvaders-screensaver`
3. ☑ **Public** (importante para GitHub Actions gratis)
4. ☑ Add a README file
5. "Create repository"

---

### Paso 3: Subir Archivos

1. "Add file" → "Upload files"
2. Arrastrar **TODOS** los archivos de esta carpeta
3. "Commit changes"

---

### Paso 4: Crear .github/workflows/build.yml

**Ver:** `COMO_CREAR_GITHUB_FOLDER.txt` para instrucciones detalladas

Resumen rápido:
1. "Add file" → "Create new file"
2. Nombre: `.github/workflows/build.yml`
3. Copiar contenido de `github-workflows/build.yml`
4. "Commit new file"

---

### Paso 5: Ejecutar Compilación

1. Pestaña "Actions"
2. Si dice "disabled" → "Enable workflows"
3. Click en "Build macOS Screensaver"
4. "Run workflow" → "Run workflow"
5. Esperar 2-3 minutos ☕

---

### Paso 6: Descargar

1. Cuando aparezca ✅ verde
2. Click en el workflow
3. Scroll abajo → "Artifacts"
4. Click "SpaceInvadersScreensaver"
5. Descargar ZIP
6. Descomprimir

---

### Paso 7: Instalar

1. Doble click en `SpaceInvadersScreensaver.saver`
2. "Instalar para este usuario"
3. Si dice "desarrollador no identificado":
   - Preferencias del Sistema → Seguridad y Privacidad
   - "Abrir de todas formas"
4. Preferencias del Sistema → Salvapantallas
5. Seleccionar "Space Invaders"
6. ¡A disfrutar! 👾

---

## 🔧 Detalles Técnicos para macOS 13+

### Cambios Específicos para Ventura+

1. **Info.plist:**
   ```xml
   <key>LSMinimumSystemVersion</key>
   <string>13.0</string>
   ```

2. **Swift Code:**
   ```swift
   @available(macOS 13.0, *)
   webView.underPageBackgroundColor = .black
   ```

3. **Compilación:**
   ```bash
   -target x86_64-apple-macosx13.0
   -target arm64-apple-macosx13.0
   ```

4. **GitHub Runner:**
   ```yaml
   runs-on: macos-13
   xcode-version: '15.0'
   ```

---

## 🆘 Resolución de Problemas

### "No aparece Build macOS Screensaver en Actions"

**Causa:** Falta `.github/workflows/build.yml`

**Solución:** Ver `COMO_CREAR_GITHUB_FOLDER.txt`

---

### "La compilación falla"

1. Verificar que todos los archivos se subieron
2. Verificar que `.github/workflows/build.yml` existe
3. Click "Re-run all jobs"
4. Ver logs para más detalles

---

### "No puedo abrir el screensaver (desarrollador no identificado)"

1. Preferencias del Sistema → Seguridad y Privacidad
2. Pestaña "General"
3. "Abrir de todas formas"

---

### "El screensaver no aparece en la lista"

1. Verificar instalación en: `~/Library/Screen Savers/`
2. Reiniciar Preferencias del Sistema
3. Verificar que el Mac tenga macOS 13.0+

---

### "Funciona pero no se ve 'dr pendejoloco'"

El crédito está en la esquina inferior izquierda, muy discreto (verde semi-transparente, 8px).
Si no lo ves, puede ser por el tamaño de pantalla. Está en el código: `main.js` línea ~313.

---

## 📋 Verificación de Requisitos

Antes de subir a GitHub, verificar:

- [ ] Archivo `build.yml` en `github-workflows/`
- [ ] Archivo `SpaceInvadersScreensaver.swift` existe
- [ ] Carpeta `SpaceInvadersScreensaver.saver/` completa
- [ ] `Info.plist` tiene `LSMinimumSystemVersion: 13.0`
- [ ] Todos los assets en `Resources/assets/`
- [ ] Leíste `COMO_CREAR_GITHUB_FOLDER.txt`

---

## 🗑️ Desinstalación

```bash
rm -rf ~/Library/Screen\ Savers/SpaceInvadersScreensaver.saver
```

Reiniciar Preferencias del Sistema.

---

## 💡 Tips

- GitHub Actions es **100% gratis** (2000 min/mes)
- El `.saver` compilado es **portable** (compartilo con amigos)
- Funciona en **Intel y Apple Silicon**
- Los artifacts se guardan **90 días** en GitHub

---

## 🤝 Compartir

El `.saver` compilado puede ser compartido. Solo asegurate que:
- El receptor tenga macOS 13.0+
- Tenga Intel Mac o Apple Silicon
- Siga las instrucciones de "desarrollador no identificado" si es necesario

---

## 📝 Changelog

**v1.0 - 2025**
- Versión inicial
- Compatible con macOS 13.0 Ventura y superiores
- Universal Binary (Intel + Apple Silicon)
- Crédito discreto: dr pendejoloco

---

## 📄 Licencia

Proyecto creado por **dr pendejoloco** - 2025

---

## 📞 Soporte

¿Problemas? Lee los archivos incluidos:
- `COMO_CREAR_GITHUB_FOLDER.txt` - Crítico para GitHub Actions
- `INSTRUCCIONES_COMPLETAS.txt` - Guía detallada paso a paso

---

¡Disfrutá tu screensaver retro! 👾🎮🕹️
