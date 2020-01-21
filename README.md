# nifi_toolkit

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with nifi_toolkit](#setup)
    * [What nifi_toolkit affects](#what-nifi_toolkit-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nifi_toolkit](#beginning-with-nifi_toolkit)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Install and configure the [Apache NiFi
Toolkit](https://nifi.apache.org/), a CLI for the Apache NiFi dataflow
automation software.

## Setup

### What nifi_toolkit affects

This module will download the Apache Toolkit NiFi tarball to
`/var/tmp/`.

The tarball will be unpacked to `/opt/nifi-toolkit` by default.

### Setup Requirements

NiFi requires Java Runtime Environment. Nifi 1.10.1 runs on Java 8 or
Java 11.

When installing on local infrastructure, consider download the
distribution tarballs, validate them with the Apache distribution
keys, and store it on a local repository. Adjust the configuration
variables to point to your local repository. The [NiFi download
page](https://nifi.apache.org/download.html) also documents how to
verify the integrity and authenticity of the downloaded files.

### Beginning with nifi_toolkit

Add dependency modules to your puppet environment:

- puppet/archive
- puppetlabs/stdlib
- camptocamp/systemd

## Usage

To download and install NiFi Toolkit, include the module. This will
download nifi toolkit and unpack it under
`/opt/nifi-toolkit/nifi-toolkit-<version>`.

```puppet
include nifi_toolkit
```
To host the file locally, add a nifi_toolkit::download_url variable for the
module.

```yaml
nifi_toolkit::download_url: "http://repo.local/nifi/1.10.0/nifi-toolkit-1.10.0-bin.tar.gz"
```

Please keep `nifi_toolkit::download_url`,
`nifi_toolkit::download_checksum` and `nifi_toolkit::version` in sync.
The URL, checksum and version should match. Otherwise, Puppet will
become confused.

## Limitations

This module is under development, and therefore somewhat light on
functionality.

Configuration and repository directories are not managed yet. These
can be managed outside the module with `file` resources.

## Development

In the Development section, tell other users the ground rules for
contributing to your project and how they should submit their work.
