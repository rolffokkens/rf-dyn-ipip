#!/bin/bash

TMP=`mktemp /tmp/rf-static-XXXXXX`

cat > $TMP

splitargs ()
{
    awk -v "PFX=$1" '{
        split ($0, a, "&");
        for (i in a) print PFX a[i];
    }'
}

eval $( splitargs ARG_ <<< "$QUERY_STRING" )
eval $( splitargs POST_ < $TMP )

[ "$ARG_ip" == "" ] && ARG_ip="$REMOTE_ADDR"

rm "$TMP"

cat << EOF
Content-type: text/html

EOF

sudo /usr/share/rf-dyn-ipip/set-remote "$ARG_id" "$POST_password" "$ARG_ip" 2>&1
