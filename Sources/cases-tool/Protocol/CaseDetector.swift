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
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: caseType)
        let hasValidCharacters = !input.filter { $0 != separator }.isEmpty
        
        return containsSeparator && noOtherSeparators && hasValidCharacters
    }
}
