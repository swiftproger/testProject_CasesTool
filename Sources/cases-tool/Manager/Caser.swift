///
///  Caser.swift
///  This file is part of the **cases-tool** project developed for **Incetro internship**
///
///  Created by Andrew Green
///  Copyright © 2024 Incetro Inc. All rights reserved.
///

import Foundation

let caserManager = CaserManager()

/// Функция, которая определяет тип case для входной строки
public func recognizeCase(from string: String) throws -> CaseType {
    try caserManager.detectCase(of: string)
}

/// Функция, которая конвертирует строку в заданный case
public func convertCase(of string: String, to targetCase: CaseType) throws -> String {
    try caserManager.convert(string, to: targetCase)
}
