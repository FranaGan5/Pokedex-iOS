import SwiftUI

struct TabViewMain: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            FavoritesPokemonView().tabItem {
                Label("Favoritos", systemImage: "heart.fill")
            }

            PokemonView().tabItem {
                Label("", image: "pokebola")
            }

            MediaView().tabItem {
                Label("Perfil", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabViewMain().environmentObject(AuthViewModel())
}

