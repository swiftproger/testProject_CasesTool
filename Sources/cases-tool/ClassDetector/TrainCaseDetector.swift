//
//  TrainCaseDetector.swift
//

final class TrainCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .trainCase
    }

    public func detect(_ input: String) -> Bool {
        guard let separator = caseType.separator else { return false }

        let containsSeparator = input.contains(separator)
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: caseType)
        let allWordsStartWithUppercase = input
            .split(separator: separator)
            .allSatisfy { $0.first?.isUppercase == true }
        let hasValidCharacters = !input.filter { $0 != separator }.isEmpty

        return containsSeparator && noOtherSeparators && allWordsStartWithUppercase && hasValidCharacters
    }
}

