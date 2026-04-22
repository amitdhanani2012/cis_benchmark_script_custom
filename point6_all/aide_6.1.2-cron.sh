crontab -u root -l > crontab.bk
if ! grep aide crontab.bk;then
echo "0 5 * * * /usr/sbin/aide --check" >> crontab.bk
crontab -u root crontab.bk
echo "done with cron aide"
else
echo "aide already there"
fi
