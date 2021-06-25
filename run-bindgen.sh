#!/bin/sh

$HOME/.cargo/bin/bindgen odpi/include/dpi.h -o src/binding.rs \
  --distrust-clang-mangling \
  --whitelist-type "^dpi.*" \
  --whitelist-function "^dpi.*" \
  --whitelist-var "^DPI_.*" \
  --bitfield-enum dpiExecMode \
  --bitfield-enum dpiFetchMode \
  --bitfield-enum dpiOpCode \
  --bitfield-enum dpiSubscrQOS \
  --no-prepend-enum-name \
  --rust-target 1.19 \
  -- -Iodpi/include

$HOME/.cargo/bin/bindgen odpi/src/dpiImpl.h -o src/binding_impl.rs \
  --whitelist-var "DPI_MAX_BASIC_BUFFER_SIZE" \
  --rust-target 1.19 \
  -- -Iodpi/include
