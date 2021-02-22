#!/bin/sh

# This script should eventually run tests on the web project, and to build that we will need the BASWS_CLIENT_ENCRYPTION_KEY environment variable
# For tests, it can be an arbitrary 32-charcter value, for example, this string: abcdefghijklmnopqrstuvwxzy123456.

cd native
cargo test --release --verbose