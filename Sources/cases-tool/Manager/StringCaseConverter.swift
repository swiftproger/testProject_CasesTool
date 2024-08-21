//
//  StringCaseConverter.swift
//

/// Класс для конвертации строк между различными типами case.
///
/// `StringCaseConverter` предоставляет методы для преобразования строк из одного типа case в другой, используя определенные правила для каждого типа case.
public class StringCaseConverter {
    
    // MARK: - Properties
    
    private let caseDetectorFactory: CaseDetectorFactory
    
    // MARK: - Initializer
    
    /// Инициализатор, принимающий фабрику для определения case.
    ///
    /// - Parameter factory: Фабрика для определения типа case строки. По умолчанию создается новая фабрика.
    public init(factory: CaseDetectorFactory = CaseDetectorFactory()) {
        self.caseDetectorFactory = factory
    }
    
    // MARK: - Public Method
    
    /// Конвертирует строку из исходного case в целевой case.
    ///
    /// - Parameters:
    ///   - input: Строка для конвертации.
    ///   - targetCaseType: Целевой тип case, в который нужно преобразовать строку.
    /// - Throws: `CaserError`, если происходит ошибка при анализе или конвертации строки.
    /// - Returns: Строка, преобразованная в целевой тип case.
    public func convert(_ input: String, to targetCaseType: CaseType) throws -> String {
        let detectedCaseType = try caseDetectorFactory.detectCase(of: input)
        
        if detectedCaseType == targetCaseType {
            return input
        }
        
        let words = splitIntoWords(from: input, by: detectedCaseType)
        return try joinWords(words, to: targetCaseType)
    }
    
    // MARK: - Private Method
    
    /// Разделяет строку на слова в зависимости от исходного типа case.
    ///
    /// - Parameters:
    ///   - input: Строка для разделения на слова.
    ///   - caseType: Исходный тип case строки.
    /// - Returns: Массив слов, извлеченных из строки.
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
    
    /// Объединяет слова в строку, используя целевой тип case.
    ///
    /// - Parameters:
    ///   - words: Массив слов для объединения.
    ///   - caseType: Целевой тип case, в который нужно объединить слова.
    /// - Throws: `CaserError`, если тип case не определен.
    /// - Returns: Строка, объединенная в целевой тип case.
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
    
    /// Разделяет строку на слова, предполагая, что она написана в `camelCase` или `PascalCase`.
    ///
    /// - Parameter input: Строка для разделения.
    /// - Returns: Массив слов, извлеченных из строки.
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
