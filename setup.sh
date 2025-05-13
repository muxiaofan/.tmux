#!/bin/bash
set -e

TOOLBOX_REPO_PATH=$(readlink -f "$(dirname "$0")/../")
BASH_CONFIG_PATH="${TOOLBOX_REPO_PATH}/bash/config/.bash_config"
source "${BASH_CONFIG_PATH}"

TMUX_CONFIG_PATH="${TOOLBOX_REPO_PATH}/tmux/"

TMUX_CONF=".tmux.conf"
TMUX_CONF_LOCAL=".tmux.conf.local"

TMUX_CONF_SRC="${TMUX_CONFIG_PATH}/${TMUX_CONF}"
TMUX_CONF_DST="${HOME}/${TMUX_CONF}"
if [ -L "${TMUX_CONF_DST}" ]; then
    unlink "${TMUX_CONF_DST}"
else
    if [ -e "${TMUX_CONF_DST}" ]; then
        ERROR "${TMUX_CONF_DST} already exists!"
        exit 1
    fi
fi

ln -s "${TMUX_CONFIG_PATH}/.tmux.conf" "${HOME}/.tmux.conf"
INFO "Created symlink: ${TMUX_CONF_SRC} → ${TMUX_CONF_DST}"

TMUX_CONF_LOCAL_SRC="${TMUX_CONFIG_PATH}/${TMUX_CONF_LOCAL}"
TMUX_CONF_LOCAL_DST="${HOME}/${TMUX_CONF_LOCAL}"
if [ -L "${TMUX_CONF_LOCAL_DST}" ]; then
    unlink "${TMUX_CONF_LOCAL_DST}"
else
    if [ -e "${TMUX_CONF_LOCAL_DST}" ]; then
        ERROR "${TMUX_CONF_LOCAL_DST} already exists!"
        exit 1
    fi
fi

ln -s "${TMUX_CONFIG_PATH}/.tmux.conf.local" "${HOME}/.tmux.conf.local"
INFO "Created symlink: ${TMUX_CONF_LOCAL_SRC} → ${TMUX_CONF_LOCAL_DST}"
