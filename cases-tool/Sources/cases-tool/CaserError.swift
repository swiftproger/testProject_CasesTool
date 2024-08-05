///
///  CaserError.swift
///  This file is part of the **cases-tool** project developed for **Incetro internship**
///
///  Created by Andrew Green
///  Copyright © 2024 Incetro Inc. All rights reserved.
///

import Foundation

// MARK: - CaserError

enum CaserError: LocalizedError {
    
    // MARK: - Cases
    
    /// Несколько разделителей в строке
    ///
    /// Пример: "some-string-with.multipleSeparators"
    case multipleSeparators(separators: [Character])
    
    /// Лишний разделитель в начале строки
    ///
    /// Пример: "-leading-separator"
    case uselessLeadingSeparator(separator: Character)
    
    /// Лишний разделитель в конце строки
    ///
    /// Пример: "trailing-separator-"
    case uselessTrailingSeparator(separator: Character)
    
    /// Несколько подряд идущих разделителей
    ///
    /// Пример: "multiple-sequenced---separators"
    case extraSequencedSeparators(separators: [String])
    
    /// Неизвестный тип кейса
    case unknownCaseType
    
    // MARK: - Properties
    
    var errorDescription: String {
        switch self {
        case .multipleSeparators(let separators):
            let separatorsString = separators.map(String.init).joined(separator: ", ")
            return "Строка содержит несколько разделителей: \(separatorsString)"
        case .uselessLeadingSeparator(let separator):
            return "Лишний разделитель в начале строки: \(separator)"
        case .uselessTrailingSeparator(let separator):
            return "Лишний разделитель в конце строки: \(separator)"
        case .extraSequencedSeparators(let separator):
            return "Несколько подряд идущих разделителей: \(separator)"
        case .unknownCaseType:
            return "Unknown case type"
        }
    }
}
