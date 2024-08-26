//
//  KebabCaseDetector.swift
//

final class KebabCaseDetector: CaseDetector {
    var caseType: CaseType { return .kebabCase }

    public func detect(_ input: String) -> Bool {
        return detectUsingSeparator(input)
    }
}
