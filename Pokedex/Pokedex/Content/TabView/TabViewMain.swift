import SwiftUI

struct TabViewMain: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            NotificacionesView().tabItem {
                Label("Multimedia", systemImage: "play.square")
            }

            HomeView().tabItem {
                Label("", image: "pokebola")
            }

            PerfilView().tabItem {
                Label("Perfil", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabViewMain().environmentObject(AuthViewModel())
}

