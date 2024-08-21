//
//  CamelCaseDetector.swift
//

/// Фабрика для определения типа case строки.
///
/// `CaseDetectorFactory` отвечает за анализ строки и определение её типа case (например, `camelCase`, `snake_case`, `PascalCase` и другие).
/// В процессе анализа строка проходит через различные проверки, включая проверку на наличие лишних разделителей в начале и конце строки,
/// проверку на наличие нескольких подряд идущих одинаковых разделителей и проверку на наличие нескольких разных разделителей.

public class CaseDetectorFactory {
    
    // MARK: - Properties
    
    private let detectors: [CaseDetector]
    private let separators: Set<Character>
    
    // MARK: - Initializer
    
    public init(detectors: [CaseDetector]) {
        self.detectors = detectors
        
        self.separators = Set(CaseType.allCases.compactMap(\.separator))
    }
    
    
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
    
    /// Основной метод для определения типа case строки.
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError` в случае ошибок при анализе строки.
    /// - Returns: Определенный тип case.
    public func detectCase(of input: String) throws -> CaseType {
        try checkLeadingAndTrailingSeparators(in: input)
        try checkForExtraSequencedSeparators(in: input)
        try checkForMultipleSeparators(in: input)
        
        return try detectCaseType(in: input)
    }
    
    // MARK: - Private Methods
    
    /// Проверяет наличие лишних разделителей в начале и конце строки.
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.uselessLeadingSeparator`, если разделитель в начале строки, или `CaserError.uselessTrailingSeparator`, если разделитель в конце строки.
    private func checkLeadingAndTrailingSeparators(in input: String) throws {
        if let firstChar = input.first, separators.contains(firstChar) {
            throw CaserError.uselessLeadingSeparator(separator: firstChar)
        }
        
        if let lastChar = input.last, separators.contains(lastChar) {
            throw CaserError.uselessTrailingSeparator(separator: lastChar)
        }
    }
    
    /// Проверяет наличие нескольких подряд идущих одинаковых разделителей.
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.extraSequencedSeparators`, если найдены последовательные одинаковые разделители.
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
    
    /// Проверяет наличие нескольких различных разделителей в строке.
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.multipleSeparators`, если найдены различные разделители.
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
    
    /// Определяет тип case строки на основе доступных детекторов.
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если тип case не был определен.
    /// - Returns: Определенный тип case.
    private func detectCaseType(in input: String) throws -> CaseType {
        for detector in detectors {
            if let detectedCase = CaseType.allCases.first(where: { detector.detect(input, for: $0) }) {
                return detectedCase
            }
        }
        throw CaserError.unknownCaseType
    }
}
