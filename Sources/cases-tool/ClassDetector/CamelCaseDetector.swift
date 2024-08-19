//
//  CamelCaseDetector.swift
//

final class CamelCaseDetector: CaseDetector {
    
    public init() {}
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .camelCase else { return false }
        
        guard let firstChar = input.first, firstChar.isLowercase else { return false }
        
        if !CaseType.containsSeparator(in: input) {
            var hasUpperCase = false
            for char in input {
                if char.isUppercase {
                    hasUpperCase = true
                }
            }
            return hasUpperCase
        }
        
        return false
    }
}
