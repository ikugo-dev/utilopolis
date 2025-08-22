#!/bin/bash
game=$1

if [ "$#" -ne 1 ] || [ ! -f "$game" ]; then
    echo "Usage: $0 <path to game>"
    exit 1
fi

__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only $game
