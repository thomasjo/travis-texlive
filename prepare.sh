#!/usr/bin/env bash

set -e

TARGET_DIR=$PWD/texlive
rm -rf $TARGET_DIR

DATE=`date -ju`
PROFILE=texlive.profile
cat > $PROFILE <<END_CAT
# texlive.profile generated on $DATE
selected_scheme scheme-custom
TEXDIR $TARGET_DIR
TEXMFHOME $TARGET_DIR/texmf
TEXMFLOCAL $TARGET_DIR/texmf-local
TEXMFCONFIG $TARGET_DIR/texmf-config
TEXMFSYSCONFIG $TARGET_DIR/texmf-config
TEXMFVAR $TARGET_DIR/texmf-var
TEXMFSYSVAR $TARGET_DIR/texmf-var
binary_x86_64-darwin 1
binary_x86_64-linux 1
collection-basic 1
collection-binextra 1
collection-latex 1
option_adjustrepo 1
option_autobackup 0
option_desktop_integration 0
option_doc 0
option_file_assocs 0
option_fmt 1
option_letter 0
option_menu_integration 0
option_path 0
option_post_code 1
option_src 0
option_sys_bin /usr/local/bin
option_sys_info /usr/local/share/info
option_sys_man /usr/local/share/man
option_w32_multi_user 0
option_write18_restricted 1
portable 1
END_CAT

rm -f installation.profile
install-tl-*/install-tl -profile $PROFILE

rm -rf $TARGET_DIR/texmf-dist/doc
rm -rf $TARGET_DIR/texmf-dist/source
rm -f texlive.tar.xz

echo "Creating tarball..."
XZ_OPT=-9 tar cJf texlive.tar.xz texlive
