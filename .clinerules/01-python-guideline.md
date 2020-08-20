# Python Development Guidelines

This document defines the mandatory engineering rules for this project.
All contributions must follow these guidelines exactly.

---

## 1. Tooling Rules

### Package & Environment Management

* **Use only `uv`** package manager
* Install packages with: `uv add package`
* Upgrade with: `uv sync -P package`
* Run tools with: `uv run tool`

## 2. Code Quality Requirements

* Full type hints are **mandatory**. No untyped functions or variables.
* All public functions, classes, and modules require docstrings.
* Functions must be small, focused, and single-responsibility.
* Maximum line length: **120** characters.
* No commented-out code.
* No unused imports or variables.
* Keep modules import-clean (no side effects at import time).


## 3. Style Conventions

* Follow PEP8 naming:

  * `snake_case` for variables, functions, modules
  * `PascalCase` for classes
  * `UPPER_SNAKE_CASE` for constants
* Use **f-strings** for all formatting.
* Keep function signatures explicit; avoid positional magic.
* Avoid unnecessary abbreviations; prefer clear names.
* Maintain consistent ordering:

  1. imports
  2. constants
  3. classes
  4. public functions
  5. private helpers

## 4. Development Philosophy

* **Simplicity first** — choose the simplest correct solution.
* **Readable code wins** — prefer clarity over cleverness.
* **Performance matters**, but never at the cost of readability.
* **Maintainability** is a design constraint.
* **Testability**: design functions and modules to be trivial to test.
* **Reusability**: avoid duplicating logic; generalize where it remains simple.
* **Minimalism**: fewer moving parts → fewer bugs.

## 5. Best Practices & Patterns

### Architectural Rules

* Apply **SOLID** principles.
* Use a **functional core, imperative shell**:
  * Core logic = pure, stateless functions.
  * Coordination = thin classes or orchestration functions.
* Avoid deep class hierarchies.
* Push impure operations (I/O, logging, filesystem) to the boundaries.

### Functional Style

* Use pure functions where they improve clarity.
* Prefer immutability where practical.
* No global state.
* Order composing functions **before** lower-level helpers.
* Use early returns to reduce nesting.

### Coding Discipline

* Use descriptive names (e.g., handler functions prefixed with `handle_...`).
* Mark issues with `TODO:` comments.
* Keep logic clean: avoid mixing concerns in a single function.
* Only modify code related to the task at hand.
* Practice DRY, KISS, YAGNI appropriately.

### Testing

* Test early and often.
* Use realistic inputs when validating functionality.
* Build small test harnesses for hard-to-test components.
* Ensure all features have trivial CPU-based tests.

## 6. PyTorch & ML-Specific Rules (if applicable)

* Use **einops** for all tensor rearrangements — never manual view/reshape unless trivial.
* Keep layers modular and ONNX-friendly (no dynamic Python logic in forward).
* Use batch-first tensors consistently.
* Avoid hidden mutable state (buffers, side-effects) unless necessary.
* Prefer explicit parametrization over hardcoded dimensions.
* All model components must remain TorchDynamo/TorchExport compatible.

## 7. File & Project Organization

* Avoid over-fragmenting the project — structure grows **only** when needed.
* Balance cleanliness with simplicity: use as few files as practical.
* Keep each file single-purpose.
* No circular imports.
* Configuration lives in Pydantic classes.
* Business logic isolated from CLI handling.

## 8. Contribution Flow

* Build iteratively; don’t implement features ahead of actual needs.
* Validate minimal functionality before adding complexity.
* Keep PRs small, focused, and easily reviewable.
* Never introduce unnecessary dependencies or abstractions.
