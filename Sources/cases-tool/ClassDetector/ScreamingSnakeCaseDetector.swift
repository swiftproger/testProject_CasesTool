//
//  ScreamingSnakeCaseDetector.swift
//

final class ScreamingSnakeCaseDetector: CaseDetector {
    var caseType: CaseType { return .screamingSnakeCase }

    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input, isUppercase: true)
    }
}
