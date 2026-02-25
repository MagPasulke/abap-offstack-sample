# ABAP Offstack Sample

A sample project showcasing how to use [abaplint](https://abaplint.org) and [abap-transpiler](https://github.com/abaplint/transpiler) to perform **off-stack ABAP linting and unit testing** — no SAP system required.

## Purpose

This project demonstrates that ABAP code quality checks and unit tests can be executed entirely locally or in a CI/CD pipeline, without connecting to a SAP backend.

- **Static code analysis** via `abaplint`
- **Unit test execution** via `abap_transpile` + Node.js

## How It Works

1. **Lint**: `abaplint` parses and analyzes the ABAP source files in `/src` against the rules defined in `abaplint.jsonc`.
2. **Transpile**: `abap_transpile` converts the ABAP classes (including local test classes) into JavaScript.
3. **Run**: The transpiled output is executed with Node.js, which runs the ABAP unit tests off-stack.

## Project Structure

```
src/                     # ABAP source files
abaplint.jsonc           # abaplint configuration (rules, syntax version, file paths)
package.json             # Node.js dependencies and scripts
```

## Prerequisites

- [Node.js](https://nodejs.org) (LTS recommended)

## Setup

```bash
npm install
```

## Scripts

| Command | Description |
|---|---|
| `npm run lint` | Run abaplint static code analysis |
| `npm run unit` | Transpile ABAP and run unit tests via Node.js |
| `npm test` | Run lint + unit tests |

## CI/CD

The `.github/workflows/qualitychecks.yml` workflow runs `abaplint` automatically on every push and pull request.

## References

- [abaplint](https://abaplint.org)
- [abaplint/transpiler](https://github.com/abaplint/transpiler)
- [open-abap](https://github.com/open-abap)
