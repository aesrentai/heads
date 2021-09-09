#!/bin/sh
# get a file and extend a TPM PCR

. /etc/functions

INDEX="$1"
URL="$2"

if [ -z "$INDEX" -o -z "$URL" ]; then
	die "Usage: $0 pcr-index url"
fi

wget "$URL" || die "$URL: failed"

FILE="`basename "$URL"`"
tpm_extend $FILE $INDEX || die "$FILE: tpm extend failed"
