//
//  DotCaseDetector.swift
//

final class DotCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .dotCase
    }

    public func detect(_ input: String) -> Bool {
        return hasValidSeparatorStructure(input) && input == input.lowercased()
    }
}
