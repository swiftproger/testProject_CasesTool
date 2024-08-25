//
//  ScreamingSnakeCaseDetector.swift
//

final class ScreamingSnakeCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .screamingSnakeCase
    }

    public func detect(_ input: String) -> Bool {
        guard let separator = caseType.separator else { return false }

        let containsSeparator = input.contains(separator)
        let isUppercaseOnly = input == input.uppercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: caseType)
        let hasValidCharacters = !input.filter { $0 != separator }.isEmpty

        return containsSeparator && isUppercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
