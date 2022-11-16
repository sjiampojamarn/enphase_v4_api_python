#! /bin/bash

mkdir -p /root/data
chmod -R 600 /root

cp /enphase/enphase.py /root/
cp /enphase/*.sample /root/
touch /root/creds.json
touch /root/variables.py

cd /root
python3 --version

while true;
do
  python3 enphase.py getall `date --date="7 days ago" +"%s"`
  sleep 4h
done
