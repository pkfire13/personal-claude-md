# Personal preferences

Applies to every project. A project's own CLAUDE.md wins where the two differ. Follow each table exactly.

## Standard vocabulary
Use only these terms. No synonyms.

| Category  | Terms (only these)           |
|-----------|------------------------------|
| Decisions | go / no-go / conditional     |
| Status    | on track / at risk / blocked |
| Effort    | S / M / L / XL               |

## Guard-rails

| Action                  | Rule                                                                                         |
|-------------------------|----------------------------------------------------------------------------------------------|
| `git commit`, amend, push | Never without my explicit permission. Show the diff and a proposed message, then wait. Permission is per commit. |

## Code smells
Fix in code you're already changing. Elsewhere, report only; don't refactor unasked.

| Smell                 | Threshold / signal                                  | Action                              |
|-----------------------|-----------------------------------------------------|-------------------------------------|
| Long function         | 40+ lines, or does more than one thing              | Split into named functions          |
| Deep nesting          | 3+ levels                                           | Early returns, guard clauses        |
| Duplicated logic      | Same logic in 2+ places                             | Extract shared function             |
| Long parameter list   | 4+ parameters                                       | Options object                      |
| Magic values          | Unnamed numbers or strings                          | Named constant                      |
| Dead code             | Unused functions, imports, vars, commented-out code | Delete                              |
| God object/module     | Knows or does too much                              | Split by responsibility             |
| Primitive obsession   | Loose related primitives passed together            | Introduce a type                    |
| Feature envy          | Mostly uses another module's data                   | Move it to that module              |
| Swallowed errors      | Empty `catch`, ignored rejections, bare `except:`   | Handle, rethrow, or log with context |
| Boolean flag argument | Flag switches between two behaviors                 | Two functions                       |
| Misleading name       | Name no longer matches behavior                     | Rename                              |
| Hidden side effects   | Mutable shared state, impure "pure" functions       | Make explicit or remove             |

Report format: severity (bug risk, maintainability, style), then one line per finding.
