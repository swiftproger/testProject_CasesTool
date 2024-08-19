//
//  SnakeCaseDetector.swift
//

/// Детектор для определения строк в формате `snake_case`.
///
/// `SnakeCaseDetector` проверяет, соответствует ли строка формату `snake_case`, где слова разделены символом подчеркивания (`_`), и все буквы находятся в нижнем регистре.
final class SnakeCaseDetector: CaseDetector {
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `snake_case`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `snake_case`.
    /// - Returns: Тип case `CaseType.snakeCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let separator = CaseType.snakeCase.separator else { return nil }
        
        if input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .snakeCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .snakeCase
        }
        return nil
    }
}
