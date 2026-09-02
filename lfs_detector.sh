#!/bin/bash
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
SIZE_THRESHOLD="+50M"

check_and_provision_lfs() {
    if ! command -v git-lfs >/dev/null 2>&1; then
        return 0
    fi

    # Find unique extensions or filenames of large files
    local large_extensions
    large_extensions=$(find "${TARGET_DIR}" -type f -size "${SIZE_THRESHOLD}" ! -path '*/.git/*' 2>/dev/null | sed -n 's/.*\.//p' | sort -u)

    if [[ -n "${large_extensions}" ]]; then
        echo "⚠️ Large files detected! Minimizing git tracking index changes..."
        git -C "${TARGET_DIR}" lfs install --local >/dev/null 2>&1

        for ext in ${large_extensions}; do
            # Only track if it isn't tracked already to eliminate terminal noise
            if ! grep -q "\*\.${ext}" "${TARGET_DIR}/.gitattributes" 2>/dev/null; then
                echo "-> Provisioning tracking for extension: *.${ext}"
                git -C "${TARGET_DIR}" lfs track "*.${ext}" >/dev/null
            fi
        done
        git -C "${TARGET_DIR}" add .gitattributes
    fi
}

check_and_provision_lfs
