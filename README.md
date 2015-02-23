# esp8266 sdk standard

This repository provides the integration scripts to build a complete standalone SDK (with toolchain) for software development with the Espressif ESP8266 and ESP8266EX chips.

It's a simple warpper script for the original solution found here:

https://github.com/pfalcon/esp-open-sdk

# Install ESP8266 SDK

```

> ./install.sh

```

# Test SDK with NodeMCU sourcecode

```

> ./nodemcu.sh

```

In order to flash the ESP8266 module with the nodemcu firmware (requires to set the module into bootloader mode) it is required to:

```

> cd nodemcu-firmware
> make flash

```

