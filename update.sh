#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/you-oops-dev/ipranges/main"
MAX_PARALLEL=5

SOURCES=(
  "akamai:list/akamai.lst:bird/akamai.txt"
  "amazon:list/amazon.lst:bird/amazon.txt"
  "amazoncloudfront:list/amazoncloudfront.lst:bird/amazoncloudfront.txt"
  "avito:list/avito.lst:bird/ru/avito.txt"
  "chatgpt:list/chatgpt.lst:bird/chatgpt.txt"
  "cloudflare:list/cloudflare.lst:bird/cloudflare.txt"
  "discord:list/discord.lst:bird/discord.txt"
  "google:list/google.lst:bird/google.txt"
  "kinopub:list/kinopub.lst:bird/kinopub.txt"
  "meta:list/meta.lst:bird/meta.txt"
  "spotify:list/spotify.lst:bird/spotify.txt"
  "oracle:list/oracle.lst:bird/oracle.txt"
  "ozonru:list/ozon.lst:bird/ru/ozon.txt"
  "rezka:list/rezka.lst:bird/rezka.txt"
  "rugov:list/rugov.lst:bird/ru/rugov.txt"
  "tiktok:list/tiktok.lst:bird/tiktok.txt"
  "telegram:list/telegram.lst:bird/telegram.txt"
  "vkontakte:list/vkontakte.lst:bird/ru/vkontakte.txt"
  "yandex:list/yandex.lst:bird/ru/yandex.txt"
  "youtube:list/youtube.lst:bird/youtube.txt"
)

BIRD_ONLY=(
  "list/cubred.lst:bird/cubred.txt"
  "list/start.lst:bird/ru/start.txt"
)

generate_bird() {
  local src="$1" dst="$2"
  [[ -f "$src" ]] && sed 's_.*_route & reject;_' "$src" > "$dst"
}

update() {
  local service="$1" list_file="$2" bird_file="$3"
  local url="${BASE_URL}/${service}/ipv4_merged.txt"
  local tmp

  tmp=$(mktemp)

  if wget -q --timeout=30 --connect-timeout=30 --tries=1 -O "$tmp" "$url"; then
    if ! cmp -s "$tmp" "$list_file" 2>/dev/null; then
      install -m 644 "$tmp" "$list_file"
      echo "Updated: $list_file"
    else
      echo "No change: $list_file"
    fi
  else
    echo "Download failed: $list_file"
  fi

  rm -f "$tmp"

  generate_bird "$list_file" "$bird_file"
}

count=0
for entry in "${SOURCES[@]}"; do
  IFS=: read -r service list_file bird_file <<< "$entry"
  update "$service" "$list_file" "$bird_file" &

  (( ++count % MAX_PARALLEL == 0 )) && wait
done
wait

for entry in "${BIRD_ONLY[@]}"; do
  IFS=: read -r src dst <<< "$entry"
  generate_bird "$src" "$dst"
done