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
TEXMFCONFIG $TEXMFSYSCONFIG
TEXMFHOME $TEXMFLOCAL
TEXMFLOCAL $TARGET_DIR/texmf-local
TEXMFSYSCONFIG $TARGET_DIR/texmf-config
TEXMFSYSVAR $TARGET_DIR/texmf-var
TEXMFVAR $TEXMFSYSVAR
binary_x86_64-darwin 1
binary_x86_64-linux 0
collection-basic 1
collection-binextra 1
collection-latex 1
collection-latexrecommended 1
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
option_src 1
option_sys_bin /usr/local/bin
option_sys_info /usr/local/share/info
option_sys_man /usr/local/share/man
option_w32_multi_user 0
option_write18_restricted 1
portable 1
END_CAT

rm -f installation.profile
install-tl-*/install-tl -profile $PROFILE

rm -r $TARGET_DIR/texmf-dist/doc

echo "Creating tarball..."
XZ_OPT=-9 tar cJf texlive.tar.xz texlive/
