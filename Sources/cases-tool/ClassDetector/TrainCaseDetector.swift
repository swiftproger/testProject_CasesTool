//
//  TrainCaseDetector.swift
//

/// Детектор для определения строк в формате `Train-Case`.
///
/// `TrainCaseDetector` проверяет, соответствует ли строка формату `Train-Case`, где слова разделены дефисом (`-`), и каждое слово начинается с заглавной буквы.
final class TrainCaseDetector: CaseDetector {
    
    // MARK: - Method
    
    /// Определяет, является ли строка в формате `Train-Case`.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError.unknownCaseType`, если строка не соответствует формату `Train-Case`.
    /// - Returns: Тип case `CaseType.trainCase`, если строка соответствует формату.
    public func detect(_ input: String) throws -> CaseType? {
        
        guard let separator = CaseType.trainCase.separator else { return nil }
        
        if input.contains(separator) &&
            input.split(separator: separator).allSatisfy({ $0.first!.isUppercase }) &&
            !CaseType.containsOtherSeparators(in: input, excluding: .trainCase) &&
            input.filter({ $0 != separator }).count > 0 {
            return .trainCase
        }
        return nil
    }
}
