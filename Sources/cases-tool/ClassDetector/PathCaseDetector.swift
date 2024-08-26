//
//  PathCaseDetector.swift
//

final class PathCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .pathCase
    }

    public func detect(_ input: String) -> Bool {
        return hasValidSeparatorStructure(input) && input == input.lowercased()
    }
}
