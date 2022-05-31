# Core Framework Repository

This repository is a collection of C/C++ core libraries used to develop for XCore:

Commonly used libraries in the Core Framework:

- Vectorized Math & DSP
- Inferencing
- Clock control 
- OTP
- Debug printing

Less commonly used libraries in the Core Framework:

- L2 cache
- Random number generation

This repository can be used standalone.  However, it is meant to be used as part of the [XCore SDK](https://github.com/xmos/xcore_sdk).

## Build Status

Build Type       |    Status     |
-----------      | --------------|
Docs             | ![CI](https://github.com/xmos/fwk_core/actions/workflows/docs.yml/badge.svg?branch=develop&event=push) |

## Cloning

Some dependent components are included as git submodules. These can be obtained by cloning this repository with the following command:

    $ git clone --recurse-submodules https://github.com/xmos/fwk_core.git

## License

This Software is subject to the terms of the [XMOS Public Licence: Version 1](https://github.com/xmos/xcore_sdk/blob/develop/LICENSE.rst)
