[![Status unit-tests ](https://github.com/swiftproger/testProject_incetro_CasesTool/actions/workflows/ci.yml/badge.svg)](https://github.com/swiftproger/testProject_incetro_CasesTool/actions/workflows/ci.yml)
![Swift Version](https://img.shields.io/badge/Swift-5.8-orange.svg)
![Project Status](https://img.shields.io/badge/status-completed-brightgreen)



# Cases Tool

- [Cases Tool](#cases-tool)
  - [Цель](#цель)
  - [Обзор](#обзор)
  - [Особенности](#особенности)
  - [Поддерживаемые форматы](#поддерживаемые-форматы)
  - [Установка](#установка)
    - [Swift Package Manager](#swift-package-manager)
  - [Использование](#использование)
    - [Определение формата строки](#определение-формата-строки)
    - [Конвертация формата строки](#конвертация-формата-строки)
    - [Обработка ошибок](#обработка-ошибок)
    - [Запуск тестов](#запуск-тестов)
  - [Техническое задание на проект](#техническое-задание-на-проект)
    - [Задача №1](#задача-№1)
      - [Примеры](#примеры)
    - [Задача №2](#задача-№2)

## Цель
**Case Detector** — это учебный проект, от компании [Incetro](https://incetro.ru/ru) для закрепления изученного материала по общим принципам разработки на Swift.

## Обзор
**Case Detector** — это библиотека на Swift, предназначенная для определения различных форматов написания строк (кейсов) и конвертации строк из одного формата в другой. Библиотека поддерживает широкий спектр форматов, включая camelCase, snake_case, kebab-case, PascalCase, Train-Case, SCREAMING_SNAKE_CASE, dot.case и path/case. Кроме того, она предоставляет надежную обработку ошибок для некорректных форматов и неправильно составленных строк.

## Особенности
- **Определение формата:** Точно определяет формат написания строки.
- **Обработка ошибок:** Предоставляет информативные сообщения об ошибках для случаев, таких как лишние разделители в начале и конце строки, несколько разных разделителей и последовательные одинаковые разделители.
- **Расширяемость:** Библиотека разработана модульно, что позволяет легко добавлять новые форматы или пользовательские детекторы.
- **Юнит-тесты:** Библиотека покрыта тестами, которые обеспечивают ее надежность для широкого диапазона входных данных и крайних случаев.

## Поддерживаемые форматы
- `camelCase:` например, someVariableName
- `snake_case:` например, some_variable_name
- `kebab-case:` например, some-variable-name
- `PascalCase:` например, SomeVariableName
- `Train-Case:` например, Some-Variable-Name
- `SCREAMING_SNAKE_CASE:` например, SOME_VARIABLE_NAME
- `dot.case:` например, some.variable.name
- `path/case:` например, some/path/name

## Установка
### Swift Package Manager
Для интеграции `Cases Tool` в ваш проект Xcode с использованием Swift Package Manager выполните следующие шаги:
1. Откройте ваш проект в Xcode.
2. Перейдите в меню File > Add Package Dependencies.
3. Введите URL репозитория: `https://github.com/swiftproger/testProject_incetro_CasesTool`.
4. Выберите Branch > master.
5. Нажмите Add Package, чтобы добавить пакет в ваш проект.
6. Add to Target выберите ваше приложение.

## Использование
### Определение формата строки
Чтобы определить формат написания строки, используйте класс `CaserManager` метод `detectCase`:

```swift
import cases_tool

    let caserManager = CaserManager()
        
    do {
      let detect = try caserManager.detectCase(of: "someVariableName")
        print("caseType: \(detect)")
    } catch {
        print("Ошибка: \(error.localizedDescription)")
    }
```

### Конвертация формата строки
Чтобы конвертировать строку из одного формата в другой, используйте класс `CaserManager` метод `convert`:

```swift
import cases_tool

    let caserManager = CaserManager()
    
    do {
        let convertedString = try caserManager.convert("some_variable_name", to: .camelCase)
        print("Конвертированная строка: \(convertedString)")
    } catch {
        print("Ошибка: \(error.localizedDescription)")
    }
```

### Обработка ошибок

Библиотека выбрасывает информативные ошибки с помощью перечисления CaserError, которое включает:
- `multipleSeparators:` Возникает, если в строке обнаружены несколько различных разделителей.
- `uselessLeadingSeparator:` Возникает, если в начале строки присутствует разделитель.
- `uselessTrailingSeparator:` Возникает, если в конце строки присутствует разделитель.
- `extraSequencedSeparators:` Возникает, если в строке есть несколько подряд идущих одинаковых разделителей.
- `unknownCaseType:` Возникает, если строка не соответствует ни одному из известных форматов.

### Запуск тестов
Проект включает в себя полный набор юнит-тестов для обеспечения надежности библиотеки. Для запуска тестов используйте следующую команду в Xcode:

```bash
Cmd + U
```

## Техническое задание на  проект

### Задача №1

Написать код, который принимает на вход строку и **возвращает тип её кейса** (из списка ниже) в любом удобном формате, который будет легко поддерживать и масштабировать

Типы кейсов, которые надо обработать:

1. **camelCase**: Первое слово с маленькой буквы, а последующие слова начинаются с заглавной без пробелов или знаков пунктуации между словами
    Например: `someVariableName`
    
2. **snake_case**: Слова разделены символом подчеркивания. Все буквы могут быть как верхнего, так и нижнего регистра
    Например: `some_variable_name`
    
3. **kebab-case**: Слова разделены символом дефиса
    Например: `some-variable-name`
    
4. **PascalCase**: Все слова начинаются с заглавной буквы без пробелов или знаков пунктуации между словами 
    Например: `SomeVariableName`
    
5. **Train-Case**: Слова разделены символом дефиса, все слова начинаются с заглавной буквы
    Например: `Some-Variable-Name`

6. **SCREAMING_SNAKE_CASE**: Аналог snake_case, но все буквы в верхнем регистре
    Например: `SOME_VARIABLE_NAME`

7. **dot.case**: Все слова разделяются точками
    Наример: `my.object.property`
    
8. **path/case**: Слова разделяются символами слэша, как пути в файловой системе.
    Например: `folder/subfolder/file`
    

### Примеры

Для фразы **Incetro Internship Example:**

| Кейс | Пример строки |
| --- | --- |
| camelCase | incetroInternshipExample |
| PascalCase | IncetroInternshipExample |
| snake_case | incetro_internship_example |
| kebab-case | incetro-internship-example |
| SCREAMING_SNAKE_CASE | INCETRO_INTERNSHIP_EXAMPLE |
| Train-Case | Incetro-Internship-Example |
| dot.case | incetro.internship.example |
| path/case | incetro/internship/example |


### Задача №2

Написать код, который принимает строку и формат выходного кейса, а **возвращает строку, сконвертированную в переданный кейс**

Например:

| Строка на входе | Целевой кейс | Итоговая строка |
| --- | --- | --- |
| IncetroInternshipExample | kebab-case | incetro-internship-example |
| INCETRO_INTERNSHIP_EXAMPLE | dot.case | incetro.internship.example |
| incetro/internship/example | Train-Case | Incetro-Internship-Example |
