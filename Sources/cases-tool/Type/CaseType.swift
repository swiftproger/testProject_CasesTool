///
///  CaseType.swift
///  This file is part of the **cases-tool** project developed for **Incetro internship**
///
///  Created by Andrew Green
///  Copyright © 2024 Incetro Inc. All rights reserved.
///

import Foundation

//  MARK: - CaseType

public enum CaseType: Equatable, CaseIterable {
    
    /// **snake_case**
    ///
    /// Слова разделены символом подчеркивания, все буквы в нижнем регистре
    case snakeCase
    
    /// **kebab-case**
    ///
    /// Слова разделены символом дефиса, все буквы в нижнем регистре
    case kebabCase
    
    /// **camelCase**
    ///
    /// Первое слово с маленькой буквы, а последующие слова начинаются с заглавной
    /// без пробелов или знаков пунктуации между словами
    case camelCase
    
    /// **PascalCase**
    ///
    /// Все слова начинаются с заглавной буквы без пробелов или знаков пунктуации между словами
    case pascalCase
    
    /// **Train-Case**
    ///
    /// Слова разделены символом дефиса, все слова начинаются с заглавной буквы,
    /// только первая буква заглавная, остальные в нижнем регистре
    case trainCase
    
    /// **SCREAMING_SNAKE_CASE**
    ///
    /// Аналог **snake_case**, но все буквы в верхнем регистре
    case screamingSnakeCase
    
    /// **dot.case**
    ///
    /// Все слова разделяются точками, все буквы в нижнем регистре
    case dotCase
    
    /// **path/case**
    ///
    /// Слова разделяются символами слэша, как пути в файловой системе, все буквы в нижнем регистре
    case pathCase
    
    // MARK: - Properties
    
    public var separator: Character? {
        switch self {
        case .snakeCase, .screamingSnakeCase:
            "_"
        case .kebabCase, .trainCase:
            "-"
        case .dotCase:
            "."
        case .pathCase:
            "/"
        default:
            nil
        }
    }
}

// MARK: - extension CaseType

extension CaseType {
    
    // MARK: - Method
    
    /// Проверяет, содержит ли строка какой-либо разделитель, соответствующий одному из типов case.
    ///
    /// - Parameter input: Строка для проверки.
    /// - Returns: `true`, если строка содержит хотя бы один из разделителей, определенных в `CaseType`.
    public static func containsSeparator(in input: String) -> Bool {
        for caseType in CaseType.allCases {
            if let separator = caseType.separator, input.contains(separator) {
                return true
            }
        }
        return false
    }
    
    /// Проверяет, содержит ли строка разделители, отличные от указанного разделителя.
    ///
    /// - Parameters:
    ///   - input: Строка для проверки.
    ///   - excluding: Разделитель, который нужно исключить из проверки.
    /// - Returns: `true`, если строка содержит разделители, отличные от указанного.
    public static func containsOtherSeparators(in input: String, excluding currentCaseType: CaseType) -> Bool {
        for caseType in CaseType.allCases {
            if let separator = caseType.separator, separator != currentCaseType.separator, input.contains(separator) {
                return true
            }
        }
        return false
    }
}
