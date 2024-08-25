//
//  PathCaseDetector.swift
//

final class PathCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .pathCase
    }

    public func detect(_ input: String) -> Bool {
        guard let separator = caseType.separator else { return false }

        let containsSeparator = input.contains(separator)
        let isLowercaseOnly = input == input.lowercased()
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: caseType)
        let hasValidCharacters = !input.filter { $0 != separator }.isEmpty

        return containsSeparator && isLowercaseOnly && noOtherSeparators && hasValidCharacters
    }
}
