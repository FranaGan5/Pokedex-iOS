import SwiftUI

@MainActor
final class PerfilViewModel: ObservableObject {
    func logOut(authViewModel: AuthViewModel) {
        do {
            try AuthenticationManager.shared.signOut()
            authViewModel.user = nil
        } catch {
            print("❌ Error al cerrar sesión: \(error.localizedDescription)")
        }
    }
}

struct PerfilView: View {
    @StateObject private var viewModel = PerfilViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel  // Usa el ViewModel global

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        List(lista) { item in
                            HStack {
                                emoji(emoji: item)
                                Text(item.nombre)
                                    .bold()
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    VStack {
                        HStack {
                            Button("Cerrar Sesión") {
                                viewModel.logOut(authViewModel: AuthViewModel())
                            }
                            .padding(.bottom, 30)
                            .foregroundColor(.red)
                            
                            Image("boton-cerrar")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 30)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}

struct emoji: View {
    let emoji: ModeloPerfil
    var body: some View {
        ZStack {
            Text(emoji.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 3)
                )
        }
    }
}

#Preview {
    PerfilView().environmentObject(AuthViewModel()) 
}

