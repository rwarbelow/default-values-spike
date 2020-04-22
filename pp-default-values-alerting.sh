#!/bin/bash

echo 'Starting test...'

echo 'Setting token'
token="&zwnj;"

echo 'Setting employers'
employers=('walmart' 'fiveguys' 'wm')

default_content_employers=()

# echo 'Starting loop'
# for employer in "${employers[@]}"; do 
#   echo "Checking ${employer}..."
#   url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
#   if curl -k -l ${url} | cat | grep -q "$token"; then
#       echo "Default content found for ${employer}"
#   else
#       echo "Default content not found"
#   fi
# done




echo 'Starting loop'
for employer in "${employers[@]}"; do 
  echo "Checking ${employer}..."
  url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
  if curl -k -l ${url} | cat | grep -q "$token"; then
    default_content_employers+=(${employer})
    echo "Added ${employer} to default_content_employers"
  else
    echo "Default content not found"
  fi
done

echo "Partner pages with default content: ${default_content_employers[@]}"



# echo 'Starting test...'

# token="&zwnj;"

# employers=('walmart' 'fiveguys' 'wm')

# for employer in "${employers[@]}"; do
#   url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
#   curl -k -o "${employer}-landing.html" ${url}
# done

