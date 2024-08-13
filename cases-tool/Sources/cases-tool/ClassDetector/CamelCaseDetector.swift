//
//  CamelCaseDetector.swift
//

/// Детектор для определения строк в формате `camelCase`.
///
/// `CamelCaseDetector` проверяет, соответствует ли строка формату `camelCase`, где первое слово начинается с маленькой буквы, а каждое последующее слово с заглавной буквы.
public class CamelCaseDetector: CaseDetector {

    // MARK: - Initializer

    /// Инициализатор по умолчанию.
    public init() {}
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `camelCase`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `camelCase`.
    /// - Returns: Тип case `CaseType.camelCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        guard let firstChar = input.first, firstChar.isLowercase else {
            return nil
        }
        
        if !CaseType.containsSeparator(in: input) {
            var hasUpperCase = false
            for char in input {
                if char.isUppercase {
                    hasUpperCase = true
                }
            }
            if hasUpperCase {
                return .camelCase
            }
        }
        
        return nil
    }
}
