//
//  CamelCaseDetector.swift
//

final class CamelCaseDetector: CaseDetector {
    
    var caseType: CaseType {
        return .camelCase
    }

    public func detect(_ input: String) -> Bool {
        let hasNoSeparators = !CaseType.containsSeparator(in: input)
        let startsWithLowercase = input.first?.isLowercase == true
        let containsUppercase = input.contains(where: \.isUppercase)
        
        return hasNoSeparators && startsWithLowercase && containsUppercase
    }
}
