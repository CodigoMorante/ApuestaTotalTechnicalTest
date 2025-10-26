//
//  MedalsView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI
import SwiftData

struct MedalsView: View {
    @StateObject var viewModel: MedalsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.medals, id: \.id) { item in
                            MedalCards(medal: item)
                        }
                        .padding()
                    }
                }
                .background(Color.green.opacity(0.3))
                .onAppear {
                    viewModel.loadMedals()
                    viewModel.increaseMedalPoints()
                    print("Hola")
                }

            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17,
                255
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16,
                int >> 8 & 0xFF,
                int & 0xFF,
                255
            )
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF,
                int >> 24
            )
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
extension ModelContainer {
    static var previewWithData: ModelContainer {
        let schema = Schema([MedalLocal.self])
        let container = try! ModelContainer(for: schema, configurations: [.init(isStoredInMemoryOnly: true)])
        let context = container.mainContext
        context.insert(MedalLocal(id: "M1", name: "A", descriptionMedal: "AAAA", icon: "AAA", category: "ASDASD", rarity: "ASD", backgroundColor: "#FFF4E6", progressColor: "#FFF4E6", level: 2, points: 2, maxLevel: 2, reward: "ASD", unlockedAt: "ASD", nextLevelGoal: "ASD", isLocked: false, animationType: "asd"))
        context.insert(MedalLocal(id: "M2", name: "B", descriptionMedal: "AAAA", icon: "AAA", category: "ASDASD", rarity: "ASD", backgroundColor: "#FFF4E6", progressColor: "#FFF4E6", level: 2, points: 2, maxLevel: 2, reward: "ASD", unlockedAt: "ASD", nextLevelGoal: "ASD", isLocked: false, animationType: "asd"))
        return container
    }
}
//#Preview {
//    let context = ModelContainer.previewWithData.mainContext
//    MedalsView(viewModel: MedalsViewModel(useCase: GetMedalsUseCase(repository: MedalRepository(context: context))))
//}
