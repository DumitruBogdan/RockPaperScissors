import SwiftUI

struct ContentView: View {
    @StateObject var choice = ViewModel();
    var body: some View {
        ZStack{
            LinearGradient( gradient: Gradient( stops: [
                .init(color: Color(red: 0.91, green: 0.55, blue: 0.55), location: 0.2),
                .init(color: Color(red: 0.65, green: 0.56, blue: 0.99), location: 0.55),
            ]), startPoint: .top, endPoint: .bottom )
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("The system chose \(choice.systemChoice.decision.rawValue) and the system must \(choice.showMessage) \nPlease select the correct decision: ")
                    .padding()
                    .multilineTextAlignment(.center)
                HStack(spacing: 20) {
                    ForEach(choice.decisions, id: \.self) { decision in
                        Button {
                            choice.manageGame(decision: decision)
                        } label: {
                            Text("\(choice.returnSystemImage(decision: decision))")
                                .font(.largeTitle)
                        }
                    }
                }
                Spacer()
                Text("Current score is \(choice.score)")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
