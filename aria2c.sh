conf_path=/aria2/conf
conf_copy_path=/aria2/conf-copy
data_path=/aria2/data

userid=0 # 65534 - nobody, 0 - root
groupid=0

if [ ! -f $conf_path/aria2.conf ]; then
	cp $conf_copy_path/aria2.conf $conf_path/aria2.conf
    if [ -n "$RPC_SECRET" ]; then
        printf '\nrpc-secret=%s\n' ${RPC_SECRET} >> $conf_path/aria2.conf
    fi
fi

touch ./conf/aria2.session

if [[ -n "$PUID" && -n  "$PGID" ]]; then
    userid=$PUID
    groupid=$PGID
fi

chown -R $userid:$groupid $conf_path
chown -R $userid:$groupid $data_path

su-exec $userid:$groupid aria2c --conf-path="$conf_path/aria2.conf"