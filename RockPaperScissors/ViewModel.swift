import Foundation

enum Decision: String {
    case Rock
    case Paper
    case Scissors
}

class ViewModel: ObservableObject{
    var decisions = [Decision.Rock, Decision.Paper, Decision.Scissors]
    @Published var systemChoice = Choice()
    @Published var score = 0
    
    private func generateNextChoice(){
        var random: Int
        repeat{
            random = Int.random(in: 0...2)
        } while (systemChoice.decision == decisions[random])
        systemChoice.decision = decisions[random]
        systemChoice.mustWin = Bool.random()
    }
    
    
    private func checkMove(move: Decision) -> Bool {
        var result = false
        switch systemChoice.decision {
        case .Rock:
            if (systemChoice.mustWin && move == .Scissors ) || ( !systemChoice.mustWin && move == .Paper ) {
                result = true
            }
            
        case .Paper:
            if (systemChoice.mustWin && move == .Rock ) || ( !systemChoice.mustWin && move == .Scissors ) {
                result = true
            }

        case .Scissors:
            if ( systemChoice.mustWin && move == .Paper ) || ( !systemChoice.mustWin && move == .Rock ) {
                result = true
            }
        }
        return result
    }
    
    public func returnSystemImage( decision: Decision ) -> String {
        if decision == .Rock {
            let r = "✊🏽"
            return r
        }
        else if decision == .Scissors {
            let r = "✌🏼"
            return r
        }
        else {
            let r = "🖐🏼"
            return r
        }
    }
    
    public func manageGame( decision: Decision ) {
        if checkMove(move: decision) == true {
            score+=1;
        }
        generateNextChoice()
    }
    
    var showMessage: String {
        return systemChoice.mustWin ? "win" : "lose"
    }
}
