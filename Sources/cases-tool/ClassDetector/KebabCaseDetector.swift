//
//  KebabCaseDetector.swift
//

/// Детектор для определения строк в формате `kebab-case`.
///
/// `KebabCaseDetector` проверяет, соответствует ли строка формату `kebab-case`, где слова разделены символом дефиса (`-`), и все буквы находятся в нижнем регистре.
final class KebabCaseDetector: CaseDetector {
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `kebab-case`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `kebab-case`.
    /// - Returns: Тип case `CaseType.kebabCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let separator = CaseType.kebabCase.separator else { return nil }
        
        if input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .kebabCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .kebabCase
        }
        return nil
    }
}
