import SwiftUI

struct ContentView: View {
    @StateObject var choice = ViewModel();
    var body: some View {
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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
