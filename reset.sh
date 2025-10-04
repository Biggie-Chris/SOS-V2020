#!/bin/bash
#
# reset and deploy helper for SOS on Odroid-C2
#
# This script now syncs freshly built user applications into the NFS export
# directory before uploading the SOS image and resetting the board.

# run this script from the build directory !!!
# Author: Chris

set -euo pipefail

PATH="${0%/*}:$PATH"

CONFIG_HEADER="${PWD}/projects/aos/sos/gen_config/sos/gen_config.h"
SRC_APPS_DIR="${PWD}/projects/aos/apps"

determine_nfs_dir() {
    local nfs_base="/export/odroid"
    local ip_octet="0"

    if [ -f "${CONFIG_HEADER}" ]; then
        local extracted

        extracted=$(sed -n 's/#define[[:space:]]\+CONFIG_SOS_NFS_DIR[[:space:]]\+"\(.*\)"/\1/p' "${CONFIG_HEADER}")
        if [ -n "${extracted}" ]; then
            nfs_base="${extracted}"
        fi

        extracted=$(sed -n 's/#define[[:space:]]\+CONFIG_SOS_STATIC_IP[[:space:]]\+"\(.*\)"/\1/p' "${CONFIG_HEADER}")
        if [ -n "${extracted}" ] && [ "${extracted}" != "0.0.0.0" ]; then
            ip_octet="${extracted##*.}"
        fi
    fi

    printf '%s' "${nfs_base}-${ip_octet}-root"
}

sync_user_apps() {
    local src="$1" dest="$2"

    if [ ! -d "${src}" ]; then
        echo "warning: applications directory not found: ${src}" >&2
        return 0
    fi

    echo "Syncing user apps to ${dest}"
    mkdir -p "${dest}"

    # remove existing executable files (leave data files such as pf untouched)
    find "${dest}" -maxdepth 1 -type f -perm -u+x -print0 | xargs -0r rm -f

    # copy newly built executables
    while IFS= read -r -d '' bin; do
        local name
        name=$(basename "${bin}")
        install -m 755 "${bin}" "${dest}/${name}"
    done < <(find "${src}" -mindepth 2 -maxdepth 2 -type f -perm -u+x -print0)
}

NFS_DIR=$(determine_nfs_dir)
sync_user_apps "${SRC_APPS_DIR}" "${NFS_DIR}"

IMAGE="${PWD}/images/sos-image-arm-odroidc2"
if [ ! -f "${IMAGE}" ]; then
    echo "warning: SOS image not found at ${IMAGE}; skipping copy" >&2
else
    if [ ! -w "/srv/tftp" ]; then
        echo "Copying SOS image to /srv/tftp/ (requires sudo)"
        sudo install -m 644 "${IMAGE}" /srv/tftp/
    else
        cp "${IMAGE}" /srv/tftp/
    fi
fi

echo "apps/ sync complete, image copied. Please reset board manually."
