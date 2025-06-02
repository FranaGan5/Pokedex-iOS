
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
                VStack (alignment: .center){
                        HStack {
                            Button("Cerrar sesión") {
                                viewModel.logOut(authViewModel: AuthViewModel())
                            }
                            .foregroundColor(.red)
                            
                            Image("boton-cerrar")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .background(.pokeBlack)
                    .cornerRadius(8)
                    
                }
            }
        }
    }



#Preview {
    MediaView().environmentObject(AuthViewModel()) 
}

