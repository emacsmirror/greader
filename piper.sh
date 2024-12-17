#!/bin/sh

# ** Piper parameters configuration  **
# Piper binary
# Piper binary should be in your PATH.
PIPER_BIN="piper"
# Text-to-speech model; must be the full path
MODEL="en_US-lessac-medium.onnx"
# Output format (e.g. raw, wav)
OUTPUT_FORMAT="raw"
# Sampling rate
SAMPLE_RATE=22050
# Audio format for aplay
AUDIO_FORMAT="S16_LE"
# software used to play the audio generated by piper
AUDIO_PLAYER_BIN="aplay"
# options for the audio player software
AUDIO_PLAYER_OPTS="-r ${SAMPLE_RATE} -f ${AUDIO_FORMAT} -t ${OUTPUT_FORMAT} -"

TTS="${1}"

# User input control
if test "${TTS}" = ""; then
    echo "Usage: $0 \"Text to synthesize\""
    exit 1
fi

# Check existence of model and Piper
if ! command -v "${PIPER_BIN}" > /dev/null 2>&1; then
    echo "Error: The Piper executable file is not present."
    exit 2
fi

if ! test -f "${MODEL}"; then
    echo "Error: Model ${MODEL} is not present in the current directory."
    exit 3
fi

if ! command -v "${AUDIO_PLAYER_BIN}" > /dev/null 2>&1; then
    echo "Error: The audio player executable file is not present."
    exit 4
fi

# Text-to-speech flow
echo "${TTS}" | \
    "${PIPER_BIN}" --model "${MODEL}" --output-${OUTPUT_FORMAT} | \
    "${AUDIO_PLAYER_BIN}" ${AUDIO_PLAYER_OPTS}
