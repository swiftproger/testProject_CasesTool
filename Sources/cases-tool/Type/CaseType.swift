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
    
    // MARK: - Methods
    
    /// Checks if the given string contains any of the separators associated with different `CaseType` values.
    ///
    /// This method iterates through all `CaseType` values, extracts their associated separators, and checks if
    /// any of these separators are present in the provided input string.
    ///
    /// - Parameter input: The string to be checked for the presence of any separators.
    /// - Returns: `True` if the input string contains any separator defined in the `CaseType`, otherwise `False`.
    public static func containsSeparator(in input: String) -> Bool {
        return allCases
            .compactMap(\.separator)
            .contains(where: input.contains)
    }
    
    /// Checks if the given string contains any separators other than the one associated with the specified `CaseType`.
    ///
    /// This method iterates through all `CaseType` values, extracts their associated separators, and filters
    /// them based on their presence in the input string. It then checks if any of the separators found are different
    /// from the separator associated with the given `CaseType`.
    ///
    /// - Parameters:
    ///   - input: The string to be checked for the presence of separators.
    ///   - currentCaseType: The `CaseType` whose separator should be excluded from the check.
    /// - Returns: `True` if the input string contains any separator different from the one associated with the
    ///   specified `CaseType`, otherwise `False`.
    public static func containsOtherSeparators(in input: String, excluding currentCaseType: CaseType) -> Bool {
        return allCases
            .compactMap(\.separator)
            .filter(input.contains)
            .contains { $0 != currentCaseType.separator }
    }
}
