//
//  ScreamingSnakeCaseDetector.swift
//

final class ScreamingSnakeCaseDetector: CaseDetector {
    
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .screamingSnakeCase else { return false }
        
        guard let separator = CaseType.screamingSnakeCase.separator else { return false }
        
        return input.contains(separator) &&
            input == input.uppercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .screamingSnakeCase) &&
            input.filter({ $0 != separator }).count > 0
    }
}
