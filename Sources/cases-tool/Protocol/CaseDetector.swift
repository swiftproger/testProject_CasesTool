//
//  CaseDetector.swift
//

/// A protocol that defines the structure for case type detectors.
///
/// Conforming types must specify a `caseType` and implement a method to detect if a given string
/// conforms to that case type.
public protocol CaseDetector {
    /// The specific case type this detector is responsible for.
    var caseType: CaseType { get }
    
    /// Checks if the given string matches the case type this detector handles.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string matches the case type; otherwise, `False`.
    func detect(_ input: String) -> Bool
}


/// Provides some common methods for checking case formats.
extension CaseDetector {
    
    /// Checks if the string has a valid structure based on the case type's separator.
    ///
    /// - Parameter input: The string to check.
    /// - Returns: `True` if the string has the correct separator and only contains valid characters.
    func hasValidSeparatorStructure(_ input: String) -> Bool {
        guard let separator = caseType.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let containsOnlyValidCharacters = input.allSatisfy { $0.isLetter || $0 == separator }
        let hasLetters = input.contains { $0.isLetter }
        
        return containsSeparator && containsOnlyValidCharacters && hasLetters
    }
    
    /// Checks if the string matches the case type, considering separators and letter casing.
    ///
    /// - Parameters:
    ///   - input: The string to check.
    ///   - isUppercase: `True` if the string should be uppercase, `False` if it should be lowercase. Defaults to `False`.
    /// - Returns: `True` if the string matches the case type, otherwise `False`.
    func detectUsingSeparator(_ input: String, isUppercase: Bool = false) -> Bool {
        guard hasValidSeparatorStructure(input) else { return false }
        
        let isCorrectCase = isUppercase ? input == input.uppercased() : input == input.lowercased()
        
        return isCorrectCase
    }
}
