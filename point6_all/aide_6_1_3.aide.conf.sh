echo -e "\e[32maide Audit Tools started\e[0m"
printf '\n%s' "# Audit Tools" "$(readlink -f /sbin/auditctl) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/auditd) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/ausearch) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/aureport) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/autrace) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/augenrules) p+i+n+u+g+s+b+acl+xattrs+sha512" >> /etc/aide.conf
aide --init 
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
if [ $? -eq 0 ];then
echo -e "done with auditctl \e[32m[pass]\e[0m"
else
echo -e "not done with auditctl \033[31m[fail]\033[0m "
fi
