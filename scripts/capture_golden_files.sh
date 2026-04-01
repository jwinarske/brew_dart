#!/bin/bash
# Capture golden files from real brew output for parser tests.
# Run on a macOS machine with brew installed.
set -euo pipefail

OUT="test/parsers/golden"
mkdir -p "$OUT"

echo "Capturing golden files from brew $(brew --version | head -1)..."

brew info --json=v2 git > "$OUT/info_v2_single_formula.json"
brew info --json=v2 --cask docker > "$OUT/info_v2_single_cask.json" || echo '{"formulae":[],"casks":[]}' > "$OUT/info_v2_single_cask.json"
brew info --json=v2 --installed > "$OUT/info_v2_installed.json"
brew info --json=v2 openssl@3 > "$OUT/info_v2_keg_only.json" || true
brew outdated --json=v2 > "$OUT/outdated_v2.json" || echo '{"formulae":[],"casks":[]}' > "$OUT/outdated_v2.json"
brew tap-info --json --installed > "$OUT/tap_info_v1.json"
brew search node > "$OUT/search_node.txt"
brew search xyznonexistent > "$OUT/search_no_results.txt" 2>&1 || true
brew search --cask docker > "$OUT/search_casks_only.txt" || true
brew list --formula -1 > "$OUT/list_formulae.txt"
brew list --cask -1 > "$OUT/list_casks.txt" || true
brew list --versions > "$OUT/list_versions.txt"
brew services list > "$OUT/services_list.txt" 2>&1 || true
brew doctor > "$OUT/doctor.txt" 2>&1 || true
brew config > "$OUT/config.txt"

echo "Golden files captured to $OUT/"
echo "brew version: $(brew --version | head -1)"
