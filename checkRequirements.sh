#!/bin/bash

if ! command -v ruby &>/dev/null; then
    echo "❌ 'ruby' not found in PATH. Install Ruby via your package manager (e.g. 'paru --sync ruby' on Arch, 'brew install ruby' on macOS)." >&2
    exit 10
fi

if ! command -v bundle &>/dev/null; then
    echo "❌ 'bundle' not found in PATH. Install Bundler with 'gem install bundler', then make sure its bin path is in your PATH." >&2
    exit 11
fi

if [[ -z "${GEM_HOME}" ]]; then
    echo "⚠️ GEM_HOME is not set. Set it to a directory writable by your user where gems will be stored (e.g. 'export GEM_HOME=/usr/local/share/ruby-gems')." >&2
fi

if [[ ! -w "${GEM_HOME}" ]]; then
    echo "⚠️ GEM_HOME is not writable by the current user. Check directory permissions or group membership (hint: 'ruby-gems' group on this machine):" >&2
    echo "${GEM_HOME}" >&2
fi
