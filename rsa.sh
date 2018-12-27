if [ ! -e ./id_rsa ]
then
    ssh-keygen -t rsa -b 4096 -f ./id_rsa -N ''
fi
if [ ! -e ./id_rsa_db ]
then
    ssh-keygen -t rsa -b 4096 -f ./id_rsa_db -N ''
fi
