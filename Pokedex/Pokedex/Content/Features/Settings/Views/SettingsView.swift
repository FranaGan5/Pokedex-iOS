
import SwiftUI


struct MediaView: View {
    @StateObject private var viewModel = MediaViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel  // Usa el ViewModel global

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                      
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



#Preview {
    MediaView().environmentObject(AuthViewModel()) 
}

