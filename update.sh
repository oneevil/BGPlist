#!/bin/bash

update() {
  url="$1"
  file="$2"

  tmp=$(mktemp)

  if wget -q --timeout=30 --connect-timeout=30 --tries=1 -O "$tmp" "$url"; then
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
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=avito.ru" list/avito.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=chatgpt.com" list/chatgpt.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/cloudflare/ipv4_merged.txt list/cloudflare.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=discord.com&site=discord.gg&site=discord.media" list/discord.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/google/ipv4_merged.txt list/google.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=yandex%40kinopoisk.ru" list/kinopoiskru.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=kino.pub" list/kinopub.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=mail.ru&site=mailru%40cloud.mail.ru&site=mailru%40news.mail.ru&site=mailru%40other&site=mailru%40otvet.mail.ru" list/mailru.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=messenger.com&site=whatsapp.com&site=facebook.com&site=instagram.com" list/meta.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=deezer.com&site=spotify.com" list/music.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=ok.ru" list/okru.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/oracle/ipv4_merged.txt list/oracle.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=ozon.ru" list/ozon.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=pornhub.com" list/porn.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=hdrezka.ag" list/rezka.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=roblox.com" list/roblox.lst
update https://raw.githubusercontent.com/you-oops-dev/ipranges/main/rugov/ipv4_merged.txt list/rugov.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=tiktok.com" list/tiktok.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=themoviedb.org" list/themoviedb.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=1337x.to&site=booktracker.org&site=filmitorrent.net&site=freetp.org&site=kinozal.me&site=newstudio.tv&site=nnmclub.to&site=rustorka.com&site=rutor.info&site=rutracker.org&site=thepiratebay.org&site=torrent.by" list/torrents.lst
update "https://iplist.opencck.org/?format=text&data=cidr4&site=telegram.org" list/telegram.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=vk.com&site=vk%40vkplay.ru&site=vk%40vkvideo.ru" list/vkontakte.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=yandex%40kinopoisk.ru&site=yandex.ru&site=yandex%40alice&site=yandex%40auto.ru&site=yandex%40business&site=yandex%40cdn&site=yandex%40cloud&site=yandex%40disk&site=yandex%40mail&site=yandex%40maps&site=yandex%40market&site=yandex%40media&site=yandex%40other&site=yandex%40smartcaptcha&site=yandex%40tools&site=yandex%40web" list/yandex.lst
update "https://github.com/you-oops-dev/ipranges/blob/main/youtube/ipv4_merged.txt" list/youtube.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=rutube.ru" list/rutube.lst
update "https://russia.iplist.opencck.org/?format=text&data=cidr4&site=wb.ru" list/wb.lst

cat list/akamai.lst | sed 's_.*_route & reject;_' > bird/akamai.txt
cat list/amazon.lst | sed 's_.*_route & reject;_' > bird/amazon.txt
cat list/amazoncloudfront.lst | sed 's_.*_route & reject;_' > bird/amazoncloudfront.txt
cat list/chatgpt.lst | sed 's_.*_route & reject;_' > bird/chatgpt.txt
cat list/cloudflare.lst | sed 's_.*_route & reject;_' > bird/cloudflare.txt
cat list/cubred.lst | sed 's_.*_route & reject;_' > bird/cubred.txt
cat list/discord.lst | sed 's_.*_route & reject;_' > bird/discord.txt
cat list/google.lst | sed 's_.*_route & reject;_' > bird/google.txt
cat list/kinopoiskru.lst | sed 's_.*_route & reject;_' > bird/ru/kinopoiskru.txt
cat list/kinopub.lst | sed 's_.*_route & reject;_' > bird/kinopub.txt
cat list/mailru.lst | sed 's_.*_route & reject;_' > bird/ru/mailru.txt
cat list/meta.lst | sed 's_.*_route & reject;_' > bird/meta.txt
cat list/music.lst | sed 's_.*_route & reject;_' > bird/music.txt
cat list/okru.lst | sed 's_.*_route & reject;_' > bird/ru/okru.txt
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
cat list/rutube.lst | sed 's_.*_route & reject;_' > bird/ru/rutube.txt
cat list/wb.lst | sed 's_.*_route & reject;_' > bird/ru/wb.txt