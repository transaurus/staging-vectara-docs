#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for vectara/docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Expected to run from the docusaurus root (www/) of the checked-out repo.

# --- Node version ---
# Docusaurus 3.7.0, requires Node >=18; using Node 20
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
# shellcheck source=/dev/null
. "$NVM_DIR/nvm.sh"
nvm use 20 || nvm install 20

echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# --- Package manager + dependencies ---
# Uses npm (package-lock.json present)
npm install --legacy-peer-deps

# --- Build ---
npm run build

echo "[DONE] Build complete."
