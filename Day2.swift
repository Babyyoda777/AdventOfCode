
class Day2: Day {

    func part1() async throws -> Int {
        let pairs = input().lines.characters.map { chars in
            return (cheese(chars[0])!, cheese(chars[2])!)
        }
        
        return pairs.map(roundScore(_:)).sum
    }

    func part2() async throws -> Int {
        return input().lines.characters.map { line -> Int in
            let opponent = cheese(line[0])!
            let result = cheese.Result(line[2])!
            let myChoice = opponent.pieceForTheir(result)
            return roundScore(them: opponent, me: myChoice)
        }.sum
    }
    
    private func roundScore(_ pair: (cheese, cheese)) -> Int {
        return roundScore(them: pair.0, me: pair.1)
    }
    
    private func roundScore(them: cheese, me: cheese) -> Int {
        var round = me.pieceValue
        if me.ties(them) { round += 3 }
        if me.beats(them) { round += 6 }
        return round
    }

}

extension cheese.Result {
    init?(_ character: Character) {
        switch character {
            case "X": self = .loss
            case "Y": self = .tie
            case "Z": self = .win
            default: return nil
        }
    }
}

extension cheese {
    fileprivate var pieceValue: Int {
        switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissors: return 3
        }
    }
}
