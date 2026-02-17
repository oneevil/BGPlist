#!/bin/bash

update() {
  url="$1"
  file="$2"

  tmp=$(mktemp)

  if wget -q -O "$tmp" "$url"; then
    if ! cmp -s "$tmp" "$file" 2>/dev/null; then
      install -m 644 "$tmp" "$file"
      echo "Updated: $file"
    else
      echo "No change: $file"
    fi
  else
    echo "Download failed: $file"
  fi

  rm -f "$tmp"
}

update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/akamai/ipv4_merged.txt list/akamai.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/amazon/ipv4_merged.txt list/amazon.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/amazoncloudfront/ipv4_merged.txt list/amazoncloudfront.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/avito/ipv4_merged.txt list/avito.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=chatgpt.com" list/chatgpt.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/cloudflare/ipv4_merged.txt list/cloudflare.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=discord.com&site=discord.gg&site=discord.media" list/discord.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/google/ipv4_merged.txt list/google.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=kino.pub" list/kinopub.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=messenger.com&site=whatsapp.com&site=facebook.com&site=instagram.com" list/meta.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=deezer.com&site=spotify.com" list/music.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/oracle/ipv4_merged.txt list/oracle.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/ozonru/ipv4_merged.txt list/ozon.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=pornhub.com" list/porn.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=hdrezka.ag" list/rezka.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/rugov/ipv4_merged.txt list/rugov.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=tiktok.com" list/tiktok.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=themoviedb.org" list/themoviedb.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=1337x.to&site=booktracker.org&site=filmitorrent.net&site=freetp.org&site=kinozal.me&site=newstudio.tv&site=nnmclub.to&site=rustorka.com&site=rutor.info&site=rutracker.org&site=thepiratebay.org&site=torrent.by" list/torrents.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=telegram.org" list/telegram.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/vkontakte/ipv4_merged.txt list/vkontakte.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/yandex/ipv4_merged.txt list/yandex.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=youtube.com" list/youtube.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=roblox.com" list/roblox.lst

cat list/akamai.lst | sed 's_.*_route & reject;_' > bird/akamai.txt
cat list/amazon.lst | sed 's_.*_route & reject;_' > bird/amazon.txt
cat list/amazoncloudfront.lst | sed 's_.*_route & reject;_' > bird/amazoncloudfront.txt
cat list/chatgpt.lst | sed 's_.*_route & reject;_' > bird/chatgpt.txt
cat list/cloudflare.lst | sed 's_.*_route & reject;_' > bird/cloudflare.txt
cat list/cubred.lst | sed 's_.*_route & reject;_' > bird/cubred.txt
cat list/discord.lst | sed 's_.*_route & reject;_' > bird/discord.txt
cat list/google.lst | sed 's_.*_route & reject;_' > bird/google.txt
cat list/kinopub.lst | sed 's_.*_route & reject;_' > bird/kinopub.txt
cat list/meta.lst | sed 's_.*_route & reject;_' > bird/meta.txt
cat list/music.lst | sed 's_.*_route & reject;_' > bird/music.txt
cat list/oracle.lst | sed 's_.*_route & reject;_' > bird/oracle.txt
cat list/porn.lst | sed 's_.*_route & reject;_' > bird/porn.txt
cat list/rezka.lst | sed 's_.*_route & reject;_' > bird/rezka.txt
cat list/roblox.lst | sed 's_.*_route & reject;_' > bird/roblox.txt
cat list/telegram.lst | sed 's_.*_route & reject;_' > bird/telegram.txt
cat list/themoviedb.lst | sed 's_.*_route & reject;_' > bird/themoviedb.txt
cat list/tiktok.lst | sed 's_.*_route & reject;_' > bird/tiktok.txt
cat list/torrents.lst | sed 's_.*_route & reject;_' > bird/torrents.txt
cat list/avito.lst | sed 's_.*_route & reject;_' > bird/ru/avito.txt
cat list/ozon.lst | sed 's_.*_route & reject;_' > bird/ru/ozon.txt
cat list/rugov.lst | sed 's_.*_route & reject;_' > bird/ru/rugov.txt
cat list/start.lst | sed 's_.*_route & reject;_' > bird/ru/start.txt
cat list/vkontakte.lst | sed 's_.*_route & reject;_' > bird/ru/vkontakte.txt
cat list/yandex.lst | sed 's_.*_route & reject;_' > bird/ru/yandex.txt
cat list/youtube.lst | sed 's_.*_route & reject;_' > bird/youtube.txt