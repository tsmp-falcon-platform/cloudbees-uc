#!/usr/bin/env bash
set -euo pipefail
while read -r version; do
  output_dir="versions/mm"
  output_file="$output_dir/$version.json"
  if [ -f "$output_file" ]; then
    echo "File $output_file already exists. Skipping..."
    continue
  fi
  mkdir -p "$output_dir"
  url="https://jenkins-updates.cloudbees.com/update-center/envelope-core-mm/update-center.json?id=core-mm&version=$version"
  echo "Downloading $url to $output_file"
  curl -fsSL "$url" -o "$output_file"
done < versions.txt
