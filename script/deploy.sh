#!/bin/sh

set -eu

cd $(dirname $0)

HOST=$(cat ./host)

echo "[$HOST] Start deploying automatic unko bot.."

echo "[$HOST] Creating base directory if not exists..."
ssh $HOST 'mkdir -p ~/automatic_unko_bot/src/' 
ssh $HOST 'mkdir -p ~/automatic_unko_bot/config/' 
ssh $HOST 'mkdir -p ~/automatic_unko_bot/bin/' 
echo "[$HOST] Created base directory."

echo "[$HOST] Uploading an automatic unko bot source file..."
scp ../src/automatic_unko_bot.py $HOST:~/automatic_unko_bot/src/
echo "[$HOST] Uploaded an automatic unko bot source file."

echo "[$HOST] Uploading a secret configuration file..."
scp ../config/config.ini $HOST:~/automatic_unko_bot/config/
echo "[$HOST] Uploaded a secret configuration file."

echo "[$HOST] Uploading an automatic unko bot bin file..."
scp ../bin/automatic_unko_bot $HOST:~/automatic_unko_bot/bin/
ssh $HOST 'chmod 744 ~/automatic_unko_bot/bin/automatic_unko_bot'
echo "[$HOST] Uploaded an automatic unko bot bin file."

echo "[$HOST] Restarting automatic_unko_bot..."
ssh $HOST sudo supervisorctl restart automatic_unko_bot
echo "[$HOST] Restarted automatic_unko_bot."

echo "[$HOST] Removing tmp files..."
ssh $HOST 'rm -rf ~/tmp/supervisor/'
echo "[$HOST] Removed tmp files."

echo "[$HOST] Finish deploying automatic unko bot."

exit 0
