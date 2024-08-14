//
//  PascalCaseDetector.swift
//

/// Детектор для определения строк в формате `PascalCase`.
///
/// `PascalCaseDetector` проверяет, соответствует ли строка формату `PascalCase`, где каждое слово начинается с заглавной буквы, без разделителей между словами.
class PascalCaseDetector: CaseDetector {
    
    // MARK: - Initialiser
    
    /// Инициализатор по умолчанию.
    public init() {}
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `PascalCase`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `PascalCase`.
    /// - Returns: Тип case `CaseType.pascalCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let firstChar = input.first, firstChar.isUppercase else { return nil }
        
        if !CaseType.containsSeparator(in: input) {
            var hasLowerCase = false
            for char in input {
                if char.isLowercase {
                    hasLowerCase = true
                }
            }
            if hasLowerCase {
                return .pascalCase
            }
        }
        return nil
    }
}
