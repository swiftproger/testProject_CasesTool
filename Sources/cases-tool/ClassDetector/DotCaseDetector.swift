//
//  DotCaseDetector.swift
//

class DotCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .dotCase else { return false }
        
        guard let separator = CaseType.dotCase.separator else { return false }
        
        return input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .dotCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}
