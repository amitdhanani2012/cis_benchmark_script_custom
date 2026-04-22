crontab -u root -l > /tmp/crontab.bk
if ! grep aide /tmp/crontab.bk;then
echo "0 5 * * * /usr/sbin/aide --check" >> crontab.bk
crontab -u root /tmp/crontab.bk
echo "done with cron aide"
else
echo "aide already there"
fi
