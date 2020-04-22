
echo 'Starting test...'

echo 'Setting token'
token="&zwnj;"

echo 'Setting employers'
employers=('walmart' 'fiveguys' 'wm')

echo 'Here is the token'
echo token

echo 'Here are the employers'
echo employers

# for employer in "${employers[@]}"; do 
#     url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
#     if curl -k -l ${url} | cat | grep -q "$token"; then
#         echo "Default content found for ${employer}"
#     else
#         echo "Default content not found"
#     fi
# done




# echo 'Starting test...'

# token="&zwnj;"

# employers=('walmart' 'fiveguys' 'wm')

# for employer in "${employers[@]}"; do
#   url="https://${employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
#   curl -k -o "${employer}-landing.html" ${url}
# done

