//
// SnakeCaseDetector.swift
//

final class SnakeCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .snakeCase else { return false }
        
        guard let separator = CaseType.snakeCase.separator else { return false }
        
        return input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .snakeCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}
