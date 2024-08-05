# Задача: конвертация между различными форматами case

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

---

### Задача №2

Написать код, который принимает строку и формат выходного кейса, а **возвращает строку, сконвертированную в переданный кейс**

Например:

| Строка на входе | Целевой кейс | Итоговая строка |
| --- | --- | --- |
| IncetroInternshipExample | kebab-case | incetro-internship-example |
| INCETRO_INTERNSHIP_EXAMPLE | dot.case | incetro.internship.example |
| incetro/internship/example | Train-Case | Incetro-Internship-Example |
