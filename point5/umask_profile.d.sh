#!/usr/bin/env bash
{
while IFS= read -r -d $'\0' l_file; do
sed -ri '/^\s*umask\s+0?(0[01][0-7]|0[0-7][^7]|[^0][0-7][0-7])(\s*|\s+.*)$/s/^/# /' "$l_file"
done < <(find /etc/profile.d/ -type f -name '*.sh' -print0)
}
