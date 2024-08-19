//
//  KebabCaseDetector.swift
//

class KebabCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .kebabCase else { return false }
        
        guard let separator = CaseType.kebabCase.separator else { return false }
        
        return input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .kebabCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}
