//
//  StringCaseConverter.swift
//

/// A class for converting strings between different case types.
///
/// `StringCaseConverter` provides methods for transforming strings from one case type to another,
/// using specific rules defined for each case type.
public class StringCaseConverter {
    
    // MARK: - Properties
    
    /// A factory used to detect the case type of a string.
    private let caseDetectorFactory: CaseDetectorFactory
    
    // MARK: - Initializer
    
    /// Initializes the converter with a case detector factory.
    ///
    /// - Parameter factory: A factory used to detect the case type of the string. Defaults to a new instance of `CaseDetectorFactory`.
    public init(factory: CaseDetectorFactory = CaseDetectorFactory()) {
        self.caseDetectorFactory = factory
    }
    
    // MARK: - Public Method
    
    /// Converts a string from its current case type to a target case type.
    ///
    /// This method detects the current case type of the input string and then converts it to the specified target case type.
    ///
    /// - Parameters:
    ///   - input: The string to be converted.
    ///   - targetCaseType: The target case type to which the string should be converted.
    /// - Throws: `CaserError` if an error occurs during detection or conversion.
    /// - Returns: The string converted to the target case type.
    public func convert(_ input: String, to targetCaseType: CaseType) throws -> String {
        let detectedCaseType = try caseDetectorFactory.detectCase(of: input)
        
        if detectedCaseType == targetCaseType {
            return input
        }
        
        let words = splitIntoWords(from: input, by: detectedCaseType)
        return try joinWords(words, to: targetCaseType)
    }
    
    // MARK: - Private Methods
    
    /// Splits a string into words based on its current case type.
    ///
    /// This method separates the input string into an array of words according to the detected case type.
    ///
    /// - Parameters:
    ///   - input: The string to be split into words.
    ///   - caseType: The current case type of the string.
    /// - Returns: An array of words extracted from the string.
    private func splitIntoWords(from input: String, by caseType: CaseType) -> [String] {
        switch caseType {
        case .camelCase, .pascalCase:
            return splitCamelOrPascalCase(input)
        default:
            if let separator = caseType.separator {
                return input.split(separator: separator).map(String.init)
            }
            return [input]
        }
    }
    
    /// Joins an array of words into a string using the target case type.
    ///
    /// This method takes an array of words and joins them into a single string, formatted according to the target case type.
    ///
    /// - Parameters:
    ///   - words: The array of words to be joined.
    ///   - caseType: The target case type to which the words should be joined.
    /// - Throws: `CaserError` if the case type is not recognized.
    /// - Returns: A string formed by joining the words in the target case type.
    private func joinWords(_ words: [String], to caseType: CaseType) throws -> String {
        
        let separator = caseType.separator.map { String($0) } ?? ""
        
        switch caseType {
        case .snakeCase, .kebabCase, .dotCase, .pathCase:
            return words.joined(separator: separator).lowercased()
            
        case .camelCase:
            let firstWord = words.first?.lowercased() ?? ""
            let otherWords = words.dropFirst().map(\.capitalized)
            return ([firstWord] + otherWords).joined()
            
        case .pascalCase:
            return words.map(\.capitalized).joined()
            
        case .trainCase:
            return words.map(\.capitalized).joined(separator: separator)
            
        case .screamingSnakeCase:
            return words.joined(separator: separator).uppercased()
        }
    }
    
    /// Splits a string into words, assuming it is written in `camelCase` or `PascalCase`.
    ///
    /// This method separates the input string into words based on uppercase letters, converting them to lowercase.
    ///
    /// - Parameter input: The string to be split.
    /// - Returns: An array of words extracted from the string.
    private func splitCamelOrPascalCase(_ input: String) -> [String] {
        var words: [String] = []
        var currentWord = ""
        
        for char in input {
            if char.isUppercase {
                if !currentWord.isEmpty {
                    words.append(currentWord)
                }
                currentWord = String(char.lowercased())
            } else {
                currentWord.append(char)
            }
        }
        
        if !currentWord.isEmpty {
            words.append(currentWord)
        }
        
        return words
    }
}
