//
//  CaseDetector.swift
//

public protocol CaseDetector {
    var caseType: CaseType { get }
    func detect(_ input: String) -> Bool
}

extension CaseDetector {
    func hasValidSeparatorStructure(_ input: String) -> Bool {
        guard let separator = caseType.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let containsOnlyValidCharacters = input.allSatisfy { $0.isLetter || $0 == separator }
        let hasLetters = input.contains { $0.isLetter }
        
        return containsSeparator && containsOnlyValidCharacters && hasLetters
    }
    
    func detectUsingSeparator(_ input: String, isUppercase: Bool = false) -> Bool {
        guard hasValidSeparatorStructure(input) else { return false }
        
        let isCorrectCase = isUppercase ? input == input.uppercased() : input == input.lowercased()
        
        return isCorrectCase
    }
}
