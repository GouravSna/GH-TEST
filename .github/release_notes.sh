release_and_tag() {

    curl --request POST \
         --url https://api.github.com/repos/GouravSna/GH-TEST/pulls \
         -H "Accept: application/vnd.github+json" \
         -H "authorization: Bearer $TOKEN" \
         -H "X-GitHub-Api-Version: 2022-11-28" \
}

TOKEN=$TOKEN
release_and_tag
