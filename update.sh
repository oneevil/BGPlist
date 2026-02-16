#!/bin/bash

update() {
  url="$1"
  file="$2"

  tmp=$(mktemp)

  if wget -q -O "$tmp" "$url"; then
    if ! cmp -s "$tmp" "$file"; then
      mv "$tmp" "$file"
      echo "Updated: $file"
    else
      rm -f "$tmp"
      echo "No change: $file"
    fi
  else
    echo "Download failed: $file"
    rm -f "$tmp"
  fi
}

update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/akamai/ipv4_merged.txt akamai.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/amazon/ipv4_merged.txt amazon.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/cloudflare/ipv4_merged.txt cloudflare.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/google/ipv4_merged.txt google.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/chatgpt/ipv4_merged.txt chatgpt.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/discord/ipv4_merged.txt discord.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/meta/ipv4_merged.txt meta.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/telegram/ipv4_merged.txt telegram.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/tiktok/ipv4_merged.txt tiktok.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/oracle/ipv4_merged.txt oracle.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/roblox/ipv4_merged.txt roblox.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/youtube/ipv4_merged.txt youtube.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/ozonru/ipv4_merged.txt ozon.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/rugov/ipv4_merged.txt rugov.lst

cat akamai.lst | sed 's_.*_route & reject;_' > bird/akamai.txt
cat amazon.lst | sed 's_.*_route & reject;_' > bird/amazon.txt
cat cloudflare.lst | sed 's_.*_route & reject;_' > bird/cloudflare.txt
cat google.lst | sed 's_.*_route & reject;_' > bird/google.txt
cat chatgpt.lst | sed 's_.*_route & reject;_' > bird/chatgpt.txt
cat discord.lst | sed 's_.*_route & reject;_' > bird/discord.txt
cat meta.lst | sed 's_.*_route & reject;_' > bird/meta.txt
cat telegram.lst | sed 's_.*_route & reject;_' > bird/telegram.txt
cat themoviedb.lst | sed 's_.*_route & reject;_' > bird/themoviedb.txt
cat tiktok.lst | sed 's_.*_route & reject;_' > bird/tiktok.txt
cat torrents.lst | sed 's_.*_route & reject;_' > bird/torrents.txt
cat oracle.lst | sed 's_.*_route & reject;_' > bird/oracle.txt
cat roblox.lst | sed 's_.*_route & reject;_' > bird/roblox.txt
cat youtube.lst | sed 's_.*_route & reject;_' > bird/youtube.txt
cat ozon.lst | sed 's_.*_route & reject;_' > bird/ru/ozon.txt
cat rugov.lst | sed 's_.*_route & reject;_' > bird/ru/rugov.txt
