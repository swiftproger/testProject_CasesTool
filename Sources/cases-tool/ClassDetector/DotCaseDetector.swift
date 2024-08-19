//
//  DotCaseDetector.swift
//

/// Детектор для определения строк в формате `dot.case`.
///
/// `DotCaseDetector` проверяет, соответствует ли строка формату `dot.case`, где слова разделены точками (`.`), и все буквы находятся в нижнем регистре.
class DotCaseDetector: CaseDetector {
    
    // MARK: - Initializer
    
    /// Инициализатор по умолчанию.
    public init() {}
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `dot.case`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `dot.case`.
    /// - Returns: Тип case `CaseType.dotCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let separator = CaseType.dotCase.separator else { return nil }
        
        if input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .dotCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .dotCase
        }
        return nil
    }
}
