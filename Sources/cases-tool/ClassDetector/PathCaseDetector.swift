//
//  PathCaseDetector.swift
//

class PathCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .pathCase else { return false }
        
        guard let separator = CaseType.pathCase.separator else { return false }
        
        return input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .pathCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}
