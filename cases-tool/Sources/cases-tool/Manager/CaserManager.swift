//
//  CaserManager.swift
//

/// Класс, объединяющий функциональность определения типа case строки и конвертации строки в другой case.
///
/// `CaserManager` предоставляет удобный интерфейс для работы со строками в различных форматах.
/// Он позволяет определить тип case строки, а также преобразовать строку из одного case в другой.
public class CaserManager {
    
    // MARK: - Properties
    
    private let caseDetectorFactory: CaseDetectorFactory
    private let stringCaseConverter: StringCaseConverter
    
    // MARK: - Initialiser
    
    /// Инициализирует новый экземпляр `CaserManager` с фабрикой детекторов и конвертером case.
    ///
    /// Инициализация выполняется с использованием стандартной фабрики `CaseDetectorFactory` и конвертера `StringCaseConverter`.
    public init() {
        self.caseDetectorFactory = CaseDetectorFactory()
        self.stringCaseConverter = StringCaseConverter(factory: caseDetectorFactory)
    }
    
    // MARK: - Method
    
    /// Определяет тип case строки.
    ///
    /// - Parameter input: Строка для анализа.
    /// - Throws: `CaserError` в случае ошибок при анализе строки.
    /// - Returns: Определенный тип case.
    public func detectCase(of input: String) throws -> CaseType {
        return try caseDetectorFactory.detectCase(of: input)
    }
    
    /// Конвертирует строку из одного case в другой.
    ///
    /// - Parameters:
    ///   - input: Строка для конвертации.
    ///   - targetCaseType: Целевой case, в который нужно конвертировать строку.
    /// - Throws: `CaserError` в случае ошибок при анализе или конвертации строки.
    /// - Returns: Строка, конвертированная в целевой case.
    public func convert(_ input: String, to targetCaseType: CaseType) throws -> String {
        return try stringCaseConverter.convert(input, to: targetCaseType)
    }
}
