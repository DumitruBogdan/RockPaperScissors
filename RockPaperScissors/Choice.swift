import Foundation

struct Choice {
    public var decision: Decision;
    public var mustWin: Bool;
    init(){
        decision = .Rock;
        mustWin = false;
    }
}
