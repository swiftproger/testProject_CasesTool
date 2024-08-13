//
//  ScreamingSnakeCaseDetector.swift
//

/// Детектор для определения строк в формате `SCREAMING_SNAKE_CASE`.
///
/// `ScreamingSnakeCaseDetector` проверяет, соответствует ли строка формату `SCREAMING_SNAKE_CASE`, где слова разделены символом подчеркивания (`_`), и все буквы находятся в верхнем регистре.
public class ScreamingSnakeCaseDetector: CaseDetector {
    
    // MARK: - Initializer
    
    /// Инициализатор по умолчанию.
    public init() {}
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `SCREAMING_SNAKE_CASE`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `SCREAMING_SNAKE_CASE`.
    /// - Returns: Тип case `CaseType.screamingSnakeCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        guard let separator = CaseType.screamingSnakeCase.separator else { return nil }
        if input.contains(separator) &&
            input == input.uppercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .screamingSnakeCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .screamingSnakeCase
        }
        return nil
    }
}
