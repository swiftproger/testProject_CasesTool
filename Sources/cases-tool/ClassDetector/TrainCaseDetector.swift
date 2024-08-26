//
//  TrainCaseDetector.swift
//

final class TrainCaseDetector: CaseDetector {

    var caseType: CaseType {
        return .trainCase
    }

    public func detect(_ input: String) -> Bool {
        
        guard let separator = caseType.separator else { return false }
        guard hasValidSeparatorStructure(input) else { return false }
        
        return input
            .split(separator: separator)
            .allSatisfy { $0.first?.isUppercase == true }
    }
}
