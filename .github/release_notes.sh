release_and_tag() {

    curl --request POST \
         --url https://api.github.com/repos/GouravSna/GH-TEST/pulls \
         --header "authorization: Bearer $TOKEN" \
         --header 'content-type: application/json' \
         -d@post.json

}

TOKEN=$TOKEN
release_and_tag