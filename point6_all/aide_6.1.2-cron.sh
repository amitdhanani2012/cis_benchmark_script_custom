echo -e "\e[32maide crontab started\e[0m"
crontab -u root -l > /tmp/crontab.bk
if ! grep aide /tmp/crontab.bk;then
echo "0 5 * * * /usr/sbin/aide --check" >> crontab.bk
crontab -u root /tmp/crontab.bk
if [ $? -eq 0 ];then
echo -e "done with cron aide \e[32m[pass]\e[0m"
fi
else
echo -e "aide already there \e[32m[pass]\e[0m"
fi
