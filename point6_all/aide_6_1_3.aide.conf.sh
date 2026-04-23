printf '\n%s' "# Audit Tools" "$(readlink -f /sbin/auditctl) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/auditd) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/ausearch) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/aureport) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/autrace) p+i+n+u+g+s+b+acl+xattrs+sha512" "$(readlink -f /sbin/augenrules) p+i+n+u+g+s+b+acl+xattrs+sha512" >> /etc/aide.conf
aide --init >/dev/null
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
echo "done with auditctl"
