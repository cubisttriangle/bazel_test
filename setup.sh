#!/bin/bash

PREFIX_DIR="$HOME/ROV3R"
BIN_DIR="$PREFIX_DIR/bin"

PLATFORM="amd64"

BAZEL_VER="0.25.1"
BAZEL_DL="bazel-$BAZEL_VER-dist.zip"
BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VER/$BAZEL_DL"
BAZEL_DST="bazel-$BAZEL_VER"

DOWNLOAD_DIR="/tmp"

RC_FILE="$HOME/.bashrc"
LD_FILE="/etc/ld.so.conf.d/rover.conf"
ENV_FILE="/etc/environment"

info()
{
    echo "INFO: $1"
}

warn()
{
    echo "WARNING: $1"
}

fatal()
{
    echo "FATAL: $1"
    exit 1
}

update_ld()
{
    mkdir -p "$PREFIX_DIR"
    echo "$PREFIX_DIR" | sudo tee "$LD_FILE" || fatal "Couldn't update ld file."
    sudo ldconfig || fatal "Couldn't refresh ld cache."
}

update_path()
{
    echo "export PATH=\$PATH:$BIN_DIR" >> "$RC_FILE" || warn "Couldn't update rc file path."
    source "$RC_FILE" || warn "Couldn't source rc file: '$RC_FILE'."
}

install_misc_deps()
{
    sudo apt install -y ruby || fatal "Couldn't install random deps needed for proj."
}

install_java()
{
    # Currently, ONLY jdk 8 is supported.
    local jdk="openjdk-8-jdk"

    sudo apt install -y "$jdk" || fatal "Couldn't install java jdk, '$jdk'."

    if [ -z "$JAVA_HOME" ]; then

        info "JAVA_HOME not set. Adding to '$ENV_FILE'."

        echo "JAVA_HOME=/usr/lib/jvm/$jdk-$PLATFORM" | sudo tee -a "$ENV_FILE"

        source "$ENV_FILE"

    fi

    info "JAVA_HOME=$JAVA_HOME"
}

install_bazel_deps()
{
    sudo apt install -y build-essential pkg-config zip g++ zlib1g-dev unzip python wget || fatal "Couldn't install bazel deps."
}

install_bazel()
{
    install_java
    install_bazel_deps

    if [ ! -f "$BIN_DIR/bazel" ]; then

        local bazel_dir="$DOWNLOAD_DIR/$BAZEL_DST"
        local bazel_tgt="$bazel_dir/output/bazel"

        if [ ! -f "$bazel_tgt" ]; then

            # Download and extract.
	    mkdir -p "$DOWNLOAD_DIR" || fatal "Can't create folder to download bazel to: '$DOWNLOAD_DIR'."
            cd "$DOWNLOAD_DIR" || fatal "Can't enter download dir, '$DOWNLOAD_DIR'."
            wget -N "$BAZEL_URL" || fatal "Can't download bazel from '$BAZEL_URL'."
            unzip -o "$BAZEL_DL" -d "$BAZEL_DST" || fatal "Couldn't extract bazel sources ('$BAZEL_DL') to dst ('$bazel_dir')."
            cd "$BAZEL_DST" || fatal "Couldn't enter bazel repo dir."

            # Try to compile.
            ./compile.sh || fatal "Couldnt' compile bazel."

            # Copy bazel to bin dir.
            mkdir -p "$BIN_DIR"
            cp "$bazel_tgt" "$BIN_DIR/" || fatal "Couldn't copy '$bazel_tgt' to '$BIN_DIR/'."

            # Update path if we had to run this.
            update_path

        else

            info "Bazel already downloaded at '$BAZEL_DST'. Skipping fresh download."
	    info "If your previous build of bazel failed please resolve by running manually: '$bazel_tgt'"

        fi

    else

        info "Bazel already exists in bin dir '$BIN_DIR'. Skipping bazel setup."

    fi
}

source "$ENV_FILE"
update_ld
sudo apt update || warn "Couldn't get latest pkg sources."
install_misc_deps
install_bazel

info "Currently, you may want to add 'source /etc/environment' to your .bashrc file."
