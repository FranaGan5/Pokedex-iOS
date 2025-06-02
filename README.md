# Pokédex iOS (v1.0)

Pokédex es una aplicación iOS moderna para explorar el mundo Pokémon, desarrollada con SwiftUI y Firebase. Esta es la primera versión del proyecto, con funcionalidades básicas implementadas y lista para futuras mejoras.

## 🌟 Características

- **Lista de Pokémon**: Visualiza todos los Pokémon con búsqueda en tiempo real
- **Detalles de Pokémon**: Información detallada como habilidades, estadísticas y más
- **Autenticación**: Sistema completo con Firebase (registro, inicio de sesión)
- **Favoritos**: Guarda y gestiona tus Pokémon favoritos
- **Interfaz adaptable**: Diseño responsivo para distintos dispositivos iOS

## 📱 Capturas de pantalla

### Sistema de Autenticación
La aplicación cuenta con un sistema completo de autenticación usando Firebase:

<p align="center">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/login_view.png" width="250" alt="Pantalla de inicio">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/registrar_view.png" width="250" alt="Pantalla de registro">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/inicio_view.png" width="250" alt="Pantalla de inicio de sesión">
</p>



## 🛠️ Tecnologías

- **SwiftUI**: Framework moderno para interfaces de usuario
- **Firebase**: Autenticación de usuarios
- **PokéAPI**: Fuente de datos de Pokémon
- **Async/Await**: Para operaciones asíncronas
- **UserDefaults**: Almacenamiento local para favoritos

## 📋 Requisitos

- iOS 16.0+
- Xcode 14.0+
- Swift 5.5+

## 🚀 Instalación

1. Clona este repositorio
2. Abre `Pokedex.xcodeproj` en Xcode
3. Configura tu Firebase (opcional):
   - Crea un proyecto en Firebase
   - Añade tu propia configuración `GoogleService-Info.plist`
4. Compila y ejecuta en el simulador o dispositivo

## 📊 Arquitectura

El proyecto sigue una arquitectura MVVM (Model-View-ViewModel):

- **Models**: Definiciones de datos para Pokémon y autenticación
- **Views**: Interfaz de usuario construida con SwiftUI
- **ViewModels**: Lógica de negocio y comunicación con servicios
- **Services**: Capa de red y manejo de datos

## 🌐 API

La aplicación utiliza la [PokéAPI](https://pokeapi.co/) para obtener datos de Pokémon, incluyendo:
- Lista de Pokémon
- Detalles (estadísticas, habilidades, tipos)
- Imágenes

## 🔄 Flujo de la aplicación

1. **Autenticación**: Registro o inicio de sesión
2. **Exploración**: Navega por la lista de Pokémon
3. **Detalles**: Selecciona un Pokémon para ver información completa
4. **Favoritos**: Guarda tus Pokémon preferidos para acceso rápido
5. **Perfil**: Gestiona tu cuenta y opciones

## 🚦 Estado del Proyecto

Esta es la versión 1.0 de Pokédex, que incluye las funcionalidades esenciales. Futuras actualizaciones podrían incluir:

- Más información detallada de Pokémon
- Comparación entre Pokémon
- Modificar la sección del perfil
- Modo oscuro
