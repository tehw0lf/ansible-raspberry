#!/usr/bin/env bash
rm id_ed*
rm files/id_ed*
PASS=$(uuidgen)$(uuidgen)$(uuidgen)
ssh-keygen -t ed25519 -o -a 100 -P "$PASS" -f id_ed25519
mv id_ed25519.pub files/id_ed25519.pub
echo "$PASS" >id_ed25519_passphrase
exit 0
