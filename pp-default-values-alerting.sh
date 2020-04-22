
echo 'Starting test...'

token="&zwnj;"

employers=('walmart' 'fiveguys' 'wm')

for employer in "${employers[@]}"; do 
    url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
    if curl -k -l ${url} | cat | grep -q "$token"; then
        echo "Default content found for ${employer}"
    else
        echo "Default content not found"
    fi
done




# echo 'Starting test...'

# token="&zwnj;"

# employers=('walmart' 'fiveguys' 'wm')

# for employer in "${employers[@]}"; do
#   url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
#   curl -k -o "${employer}-landing.html" ${url}
# done

