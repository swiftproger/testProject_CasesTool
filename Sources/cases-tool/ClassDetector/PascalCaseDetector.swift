//
//  PascalCaseDetector.swift
//

class PascalCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .pascalCase else { return false }
        
        guard let firstChar = input.first, firstChar.isUppercase else { return false }
        
        if !CaseType.containsSeparator(in: input) {
            var hasLowerCase = false
            for char in input {
                if char.isLowercase {
                    hasLowerCase = true
                }
            }
            return hasLowerCase
        }
        
        return false
    }
}
