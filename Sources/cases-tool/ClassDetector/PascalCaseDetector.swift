//
//  PascalCaseDetector.swift
//

final class PascalCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .pascalCase
    }

    public func detect(_ input: String) -> Bool {
        let hasNoSeparators = !CaseType.containsSeparator(in: input)
        let startsWithUppercase = input.first?.isUppercase == true
        let containsLowercase = input.contains(where: \.isLowercase)

        return hasNoSeparators && startsWithUppercase && containsLowercase
    }
}
