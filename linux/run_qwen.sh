#!/usr/bin/env bash
set -euo pipefail

TOOL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Use the current working directory as the project root.
PROJECT_ROOT="$(pwd)"
cd "$PROJECT_ROOT"

# Default language settings to English (US) locale.
export QWEN_CODE_LANG="${QWEN_CODE_LANG:-en}"
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

if ! command -v qwen >/dev/null 2>&1; then
  echo "Qwen Code CLI is not installed."
  echo "Install it with: npm install -g @qwen-code/qwen-code@latest"
  exit 1
fi

# If QWEN_API_KEY is not set, abort with an informative message.
if [[ -z "${QWEN_API_KEY:-}" ]]; then
  echo "Error: QWEN_API_KEY environment variable is not set."
  echo "Please set QWEN_API_KEY with your Qwen API token before running this script."
  exit 1
fi

export QWEN_AIKIT_API_KEY="${QWEN_AIKIT_API_KEY:-$QWEN_API_KEY}"

qwen \
  --auth-type openai \
  --model qwen3.6-plus \
  --openai-base-url "https://qwen.aikit.club/v1" \
  --openai-api-key "$QWEN_API_KEY" \
  --append-system-prompt "You are an English-speaking coding agent. Always treat ${PROJECT_ROOT} as the only project root. Resolve all relative paths against ${PROJECT_ROOT}. The helper folder ${TOOL_DIR} contains Qwen launch files; do not edit it unless the user explicitly asks. Never create, read, or modify files outside ${PROJECT_ROOT} unless the user explicitly asks for an absolute path outside the project. Always respond in English unless the user explicitly requests another language. If the user writes in English, do not switch to Russian. Do not add HTML blocks, details, summary, Response ID, or Request ID in responses." \
