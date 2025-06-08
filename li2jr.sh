#!/bin/bash
set -e
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
if [ -z "$1" ]; then
  echo "Usage: $0 linkedin-data.zip"
  exit 1
fi
rm -rf "$SCRIPT_DIR/output"
mkdir -p "$SCRIPT_DIR/output"
docker build -t tonur/dockerized-linkedin-to-json-resume:latest "$SCRIPT_DIR"
if [[ ! -f "$1" ]]; then
  echo "Error: Input file '$1' does not exist."
  exit 1
fi

# Parse the input file
INPUT_PATH="$(realpath "$1")"
INPUT_DIR="$(dirname "$INPUT_PATH")"
INPUT_FILE="$(basename "$INPUT_PATH")"

docker run --rm -u "$(id -u):$(id -g)" \
  -v "$INPUT_DIR:/input" \
  -v "$SCRIPT_DIR/output:/output" \
  tonur/dockerized-linkedin-to-json-resume:latest "/input/$INPUT_FILE" "/output"
if [ ! -f "$SCRIPT_DIR/output/resume.json" ]; then
  echo "Error: Conversion failed. 'resume.json' not found in output directory."
  exit 1
fi
echo "✅ Converted to $SCRIPT_DIR/output/resume.json"
