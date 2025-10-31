import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                
                Text("Entrenando tu progreso...")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
    }
}
