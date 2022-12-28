release_and_tag() {

    curl \
       -H "Accept: application/vnd.github+json" \
       -H "Authorization: Bearer $TOKEN"\
       -H "X-GitHub-Api-Version: 2022-11-28" \
       https://api.github.com/repos/GouravSna/GH-TEST/pulls
}

TOKEN=$TOKEN
release_and_tag
