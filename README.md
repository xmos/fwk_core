# Core Framework Repository

This repository is a collection of C/C++ core libraries used to develop for xcore:

Commonly used libraries in the Core Framework:

- Vectorized Math & DSP
- Inferencing
- Clock control 
- OTP
- Debug printing

Less commonly used libraries in the Core Framework:

- L2 cache
- Random number generation

## Build Status

Build Type       |    Status     |
-----------      | --------------|
Docs             | ![CI](https://github.com/xmos/fwk_core/actions/workflows/docs.yml/badge.svg?branch=develop&event=push) |

## Cloning

Some dependent components are included as git submodules. These can be obtained by cloning this repository with the following command:

    $ git clone --recurse-submodules https://github.com/xmos/fwk_core.git

## Testing

No tests exist in this repository yet.  Unit tests for some libraries are in the repository for each library.

## Documentation

Information on building the documentation can be found in the docs [README](https://github.com/xmos/fwk_core/blob/develop/doc/README.rst).

## License

This Software is subject to the terms of the [XMOS Public Licence: Version 1](https://github.com/xmos/fwk_core/blob/develop/LICENSE.rst)

Third party copyrighted code is specified in the fwk_core [Copyrights and Licenses](https://github.com/xmos/fwk_core/blob/develop/doc/copyright.rst).  
