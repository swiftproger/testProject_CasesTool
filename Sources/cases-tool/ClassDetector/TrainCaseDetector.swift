//
//  TrainCaseDetector.swift
//

final class TrainCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .trainCase else { return false }
        
        guard let separator = CaseType.trainCase.separator else { return false }
        
        return input.contains(separator) &&
            input.split(separator: separator).allSatisfy { $0.first!.isUppercase } &&
            !CaseType.containsOtherSeparators(in: input, excluding: .trainCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}

