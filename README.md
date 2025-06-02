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
El sistema de autenticación está basado en Firebase Authentication, lo que aporta un flujo seguro y escalable para registro e inicio de sesión.

#### Detalles técnicos:
- Integración completa con Firebase Auth
- Validación de campos en tiempo real
- Persistencia de sesión entre reinicios de la aplicación
- Manejo de errores con mensajes descriptivos
- Transiciones fluidas entre pantallas de autenticación

<p align="center">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/login_view.png" width="250" alt="Pantalla de inicio" style="padding: 0 50px;">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/registrar_view.png" width="250" alt="Pantalla de registro" style="padding: 0 50px;">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/inicio_view.png" width="250" alt="Pantalla de inicio de sesión">
</p>

### Buscar un pókemon y mostrar sus detalles

#### Características de la lista y búsqueda:
- Implementación de `LazyVGrid` para carga eficiente
- Búsqueda en tiempo real con filtrado instantáneo
- Carga de imágenes asíncrona con `AsyncImage`
- Interfaz responsiva que se adapta a diferentes tamaños de pantalla
- Diseño visual con fondos temáticos de Pokémon

#### Detalles del Pokémon:
- Visualización completa de estadísticas con barras de progreso animadas
- Colores específicos para cada tipo de estadística
- Información detallada de habilidades con traducción al español
- Implementación de paralelismo para cargar traducciones simultáneamente
- Botón para añadir/quitar de favoritos con feedback visual inmediato

<p align="center">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/lista_pokemon.png" width="250" alt="Lista de pokemons" style="padding: 0 50px;">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/busqueda_pokemon.png" width="250" alt="Busqueda de pokemon" style="padding: 0 50px;">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/detalles_pokemon_view.png" width="250" alt="Detalles de pokemon">
</p>

### Lista de favoritos, navegationLink hacia el pókemon y su detalle. Opción de borrar con .swipe

#### Sistema de favoritos:
- Persistencia de datos mediante `UserDefaults`
- Implementación de `ObservableObject` para actualización en tiempo real
- Acciones de deslizamiento (swipe) para eliminar favoritos
- Navegación directa a los detalles del Pokémon
- Sincronización automática entre todas las vistas de la aplicación
  
<p align="center">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/favoritos_view.png" width="250" alt="Lista de favoritos" style="padding: 0 50px;">
  <img src="https://github.com/FranaGan5/Pokedex-iOS/blob/main/recursos/deslizar_delete.png" width="250" alt="Deslizar para borrar de favoritos">
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
- Filtrado por tipos de Pokémon
