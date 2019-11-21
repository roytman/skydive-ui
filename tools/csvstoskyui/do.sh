#!/bin/bash
python csvstoskyui.py data/example_datacenter/topologyrules.conf > skydivetopology.json
dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
docker run -p 8080:8080 -v "$dir"/skydivetopology.json:/usr/src/skydive-ui/assets/dump.json -v "$dir"/data/example_datacenter/config.js:/usr/src/skydive-ui/assets/config.js skydive/skydive-ui
