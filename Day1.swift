import Foundation

let input = """
//values here pls
"""

let cheese = input
	.components(separatedBy: "\n\n")
	.map { line in
		line
			.split(separator: "\n")
			.map { Int($0)! }
			.reduce(0, +)
	}

func partOne() -> String {
	cheese
		.max()!
		.description
}

func partTwo() -> String {
	cheese
		.sorted(by: >)
		.prefix(3)
		.reduce(0, +)
		.description
}

print(partOne())
print(partTwo())