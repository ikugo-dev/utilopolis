#!/bin/bash
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d "$@" &

pid=$!
cpulimit -p $pid -l 600
wait $pid
