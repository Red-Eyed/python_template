#!/usr/bin/env bash

LOCAL_DIR=$(dirname $(readlink -f $0))
cd $LOCAL_DIR

export PATH="$HOME/.local/bin:$PATH"
export UV_NATIVE_TLS=1

# install uv if it doesn't exist
if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "uv is already installed at $(command -v uv)"
fi

# update uv
uv self update

# install project deps
uv sync --all-extras

# install tools globally

# ruff: fast Python linter and formatter
uv tool install ruff

# dvc[ssh]: data version control system for ML projects with SSH support
uv tool install "dvc[ssh]"

# netron: neural network model viewer
uv tool install netron

# nvitop: GPU monitoring tool
uv tool install nvitop

# just: command runner/task runner
uv tool install rust-just

# install pre commit hook
uv run prek install
