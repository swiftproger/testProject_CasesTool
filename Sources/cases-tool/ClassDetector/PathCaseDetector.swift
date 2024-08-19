//
//  PathCaseDetector.swift
//

/// Детектор для определения строк в формате `path/case`.
///
/// `PathCaseDetector` проверяет, соответствует ли строка формату `path/case`, где слова разделяются символами слэша (`/`), и все буквы находятся в нижнем регистре.
final class PathCaseDetector: CaseDetector {
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `path/case`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `path/case`.
    /// - Returns: Тип case `CaseType.pathCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let separator = CaseType.pathCase.separator else { return nil }
        
        if input.contains(separator) &&
            input == input.lowercased() &&
            !CaseType.containsOtherSeparators(in: input, excluding: .pathCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .pathCase
        }
        return nil
    }
}
