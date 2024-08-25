//
//  CaseDetector.swift
//

public protocol CaseDetector {
    var caseType: CaseType { get }
    func detect(_ input: String) -> Bool
}
