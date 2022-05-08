# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- TO-DO: Update releases with this format:
## [Unreleased]
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security -->

## 0.3.5

- Remove unused dependencies.

## 0.3.4

- Isolate `Content` in `<section>` when rendering a `Chapter`

## 0.3.3

- Fix failing tests

## 0.3.2

- Make `MarkdownContent` render without extra line breaks

## 0.3.1

- Fix `Heading` to have an `id`

## 0.3.0

- Remove `Headed` and `HeadedContent` and all children
- Add tests for serialization to validate HTML generation besides "visual inspection"

## 0.2.2

- Fix rendering of `Author`'s `Reference`

## 0.2.1

- Expose changes from 0.2.0

## 0.2.0

- Create `HeadedContent`
- Create markdown `Content` and `HeadedContent`

## 0.1.7

- Document API better
- Create a `internal` `Reference` constructor

## 0.1.6

- Use `Reference` throughout the library

## 0.1.5

- Create `Reference` to allow linking to be handled without hard-coding

## 0.1.4

- Fix `Index` to use nested list for child items

## 0.1.3

- Fix `ContentList` not returning the inner contents to the `Index`
 
## 0.1.2

- Fix `Heading` showing `null` when there are no subtitles

## 0.1.1

- Make `Content` non-`Indexable` by default.
- Remove unused `type` property from `Content`

## 0.1.0

- Move library away from json concept and implement functionality for pure dart manipulation.

## 0.0.3

- Add `Template` class to support `TemplateContent` extensions

## 0.0.2

- Remove non-library code.
  - Removed commands.
  - Removed views.

## 0.0.1

- Initial version.
- Add models.
- Add parser.