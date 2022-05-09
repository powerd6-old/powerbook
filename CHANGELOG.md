# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.0.3] - 2022-05-09

### Fixed

- `IndexableMarkdownContent` can run methods from `Indexable` before `toHtml()` is called.


## [1.0.2] - 2022-05-09

### Added

- `NestedIndexable` to transform a list of `Headings` into a chain of `Indexable`s.
- `IndexableMarkdownContent`, a clone of `MarkdownContent`, but exposing all `Headings` generated as `Indexable`s.


## [1.0.1] - 2022-05-09

### Added

- `FocusModel` now provides the associated `Attribute` to the `Focus`
 
### Changed

- `Reference` for `Focus` now mentions the associated `Attribute`
- `MarkdownContent` will now render headers with `Heading`


## [1.0.0] - 2022-05-08

### Added

- Models to make a `Book` with `Chapter`s
- Model for `Content` with markdown

### Changed

- Use built models inside the library

### Removed

- Removed CLI tools and commands
- Removed YAML file manipulation

### Security

- Removed unused dependencies
