# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.5.0] - 2022-10-25

### Changed

- This module now downloads NiFi as a "zip" archive instead of "tar.gz", and
  requires the "unzip" package to be present.
- Install NiFi toolkit version 1.18.0 by default.
- Declare support for Ubuntu 22.04 LTS (Jammy Jellyfish)
- Declare support for RHEL 9

## [0.4.1] - 2022-01-19

### Changed

- Install NiFi toolkit version `1.15.3` by default

## [0.4.0] - 2021-12-20
### Changed
- Install NiFi toolkit version `1.15.1` by default

## [0.3.0] - 2020-08-09

### Added

- Add support for Ubuntu LTS `20.04`

### Changed

- Install NiFi toolkit version `1.14.0` by default

## [0.2.1] - 2020-03-17

### Fixed

- Update REFERENCE.md

## [0.2.0] - 2020-03-17

### Added

- Add a wrapper for cli.sh under `/usr/local/bin/nifi-cli`.
- Added acceptance testing.

### Changed

- Install NiFi toolkit version `1.11.3` by default

## [0.1.0] - 2020-01-21

### Added

- Initial release.
- Download, install and start Apache NiFi Toolkit.

[unreleased]: https://github.com/ssm/ssm-nifi_toolkit/compare/0.4.1...main
[0.4.1]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.4.1
[0.4.0]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.4.0
[0.3.0]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.3.0
[0.2.1]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.2.1
[0.2.0]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.2.0
[0.1.0]: https://github.com/ssm/ssm-nifi_toolkit/releases/tag/0.1.0
