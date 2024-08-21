//
//  CaserManager.swift
//

/// A class that combines the functionality of detecting the case type of a string and converting the string to another case type.
///
/// `CaserManager` provides a convenient interface for working with strings in various formats.
/// It allows you to determine the case type of a string as well as convert the string from one case type to another.
public class CaserManager {
    
    // MARK: - Properties
    
    /// A factory for detecting the case type of strings.
    private let caseDetectorFactory: CaseDetectorFactory
    
    /// A converter for transforming strings from one case type to another.
    private let stringCaseConverter: StringCaseConverter
    
    // MARK: - Initializer
    
    /// Initializes a new instance of `CaserManager` with a case detector factory and a case converter.
    ///
    /// The initialization is performed using the standard `CaseDetectorFactory` and `StringCaseConverter`.
    public init() {
        self.caseDetectorFactory = CaseDetectorFactory()
        self.stringCaseConverter = StringCaseConverter(factory: caseDetectorFactory)
    }
    
    // MARK: - Methods
    
    /// Determines the case type of a string.
    ///
    /// This method analyzes the input string and identifies its case type, such as `camelCase`, `snake_case`, `PascalCase`, etc.
    ///
    /// - Parameter input: The string to be analyzed.
    /// - Throws: `CaserError` in case of errors during string analysis.
    /// - Returns: The determined case type.
    public func detectCase(of input: String) throws -> CaseType {
        return try caseDetectorFactory.detectCase(of: input)
    }
    
    /// Converts a string from one case type to another.
    ///
    /// This method takes a string in one case format and converts it to the specified target case format.
    ///
    /// - Parameters:
    ///   - input: The string to be converted.
    ///   - targetCaseType: The target case type to which the string should be converted.
    /// - Throws: `CaserError` in case of errors during string analysis or conversion.
    /// - Returns: The string converted to the target case format.
    public func convert(_ input: String, to targetCaseType: CaseType) throws -> String {
        return try stringCaseConverter.convert(input, to: targetCaseType)
    }
}
