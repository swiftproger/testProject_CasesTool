//
//  CamelCaseDetector.swift
//

/// A factory for determining the case type of a string.
///
/// `CaseDetectorFactory` is responsible for analyzing a string and identifying its case type
/// (e.g., `camelCase`, `snake_case`, `PascalCase`, and others). During the analysis, the string
/// undergoes various checks, including checking for unnecessary separators at the beginning and end
/// of the string, verifying the presence of consecutive identical separators, and ensuring that the
/// string does not contain multiple different separators.
public class CaseDetectorFactory {
    
    // MARK: - Properties
    
    /// An array of detectors used to identify the case type of a string.
    private let detectors: [CaseDetector]
    
    /// A set of characters representing all possible separators from different case types.
    private let separators: Set<Character>
    
    // MARK: - Initializer
    
    /// Initializes the factory with a given array of detectors.
    /// - Parameter detectors: An array of `CaseDetector` instances used to identify the case type.
    public init(detectors: [CaseDetector]) {
        self.detectors = detectors
        self.separators = Set(CaseType.allCases.compactMap(\.separator))
    }
    
    /// Convenience initializer that creates a factory with a default set of detectors.
    public convenience init() {
        let defaultDetectors: [CaseDetector] = [
            CamelCaseDetector(),
            SnakeCaseDetector(),
            KebabCaseDetector(),
            PascalCaseDetector(),
            TrainCaseDetector(),
            ScreamingSnakeCaseDetector(),
            DotCaseDetector(),
            PathCaseDetector()
        ]
        self.init(detectors: defaultDetectors)
    }
    
    // MARK: - Public Method
    
    /// The main method for determining the case type of a string.
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError` in case of errors during the analysis.
    /// - Returns: The identified case type.
    public func detectCase(of input: String) throws -> CaseType {
        try checkLeadingAndTrailingSeparators(in: input)
        try checkForExtraSequencedSeparators(in: input)
        try checkForMultipleSeparators(in: input)
        
        return try detectCaseType(in: input)
    }
    
    // MARK: - Private Methods
    
    /// Checks for unnecessary separators at the beginning and end of the string.
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError.uselessLeadingSeparator` if a separator is found at the beginning of the string,
    /// or `CaserError.uselessTrailingSeparator` if a separator is found at the end of the string.
    private func checkLeadingAndTrailingSeparators(in input: String) throws {
        if let firstChar = input.first, separators.contains(firstChar) {
            throw CaserError.uselessLeadingSeparator(separator: firstChar)
        }
        
        if let lastChar = input.last, separators.contains(lastChar) {
            throw CaserError.uselessTrailingSeparator(separator: lastChar)
        }
    }
    
    /// Checks for consecutive identical separators in the string.
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError.extraSequencedSeparators` if consecutive identical separators are found.
    private func checkForExtraSequencedSeparators(in input: String) throws {
        var previousChar: Character?
        var currentSequence = ""
        var allSequences: [String] = []
        
        for char in input {
            if let previous = previousChar, separators.contains(char) {
                if previous == char {
                    currentSequence.append(char)
                } else {
                    if currentSequence.count > 1 {
                        allSequences.append(currentSequence)
                    }
                    currentSequence = String(char)
                }
            } else {
                if currentSequence.count > 1 {
                    allSequences.append(currentSequence)
                }
                currentSequence = ""
            }
            previousChar = char
        }
        
        if currentSequence.count > 1 {
            allSequences.append(currentSequence)
        }
        
        if !allSequences.isEmpty {
            throw CaserError.extraSequencedSeparators(separators: allSequences)
        }
    }
    
    /// Checks for multiple different separators in the string.
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError.multipleSeparators` if different separators are found.
    private func checkForMultipleSeparators(in input: String) throws {
        let foundSeparators = Array(input.filter { separators.contains($0) || (!$0.isLetter && !$0.isNumber) })
        
        let uniqueSeparators = foundSeparators.reduce(into: [Character]()) { result, char in
            if !result.contains(char) {
                result.append(char)
            }
        }
        
        if uniqueSeparators.count > 1 {
            throw CaserError.multipleSeparators(separators: foundSeparators)
        }
    }
    
    /// Determines the case type of the string based on the available detectors.
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError.unknownCaseType` if the case type could not be determined.
    /// - Returns: The identified case type.
    private func detectCaseType(in input: String) throws -> CaseType {
        for detector in detectors {
            if detector.detect(input) {
                return detector.caseType
            }
        }
        throw CaserError.unknownCaseType
    }

}
