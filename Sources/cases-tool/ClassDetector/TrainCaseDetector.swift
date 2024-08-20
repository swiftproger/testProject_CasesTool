//
//  TrainCaseDetector.swift
//

/// A detector for identifying strings in `Train-Case` format.
///
/// The `TrainCaseDetector` checks whether a given string conforms to the `Train-Case` format,
/// where words are separated by hyphens (`-`), and each word starts with an uppercase letter.
final class TrainCaseDetector: CaseDetector {

    /// Determines whether the given string conforms to the `Train-Case` format.
    ///
    /// This method checks if the specified `CaseType` is `.trainCase`, verifies that the input string contains hyphens,
    /// and does not contain any other separators. It also ensures that each word starts with an uppercase letter
    /// and that the string has at least one non-separator character.
    ///
    /// - Parameters:
    ///   - input: The string to be analyzed.
    ///   - caseType: The `CaseType` that should be checked, which in this case should be `.trainCase`.
    /// - Returns: `True` if the string conforms to the `Train-Case` format; otherwise, `False`.
    public func detect(_ input: String, for caseType: CaseType) -> Bool {
        guard caseType == .trainCase else { return false }
        guard let separator = CaseType.trainCase.separator else { return false }
        
        let containsSeparator = input.contains(separator)
        let noOtherSeparators = !CaseType.containsOtherSeparators(in: input, excluding: .trainCase)
        let allWordsStartWithUppercase = input
            .split(separator: separator)
            .allSatisfy { $0.first?.isUppercase == true }
        let hasValidCharacters = input.filter { $0 != separator }.isEmpty == false
        
        return containsSeparator && noOtherSeparators && allWordsStartWithUppercase && hasValidCharacters
    }
}
