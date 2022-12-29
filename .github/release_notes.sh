#echo $PREV_TAG
#echo $NEW_TAG
#echo $RELEASE_NOTES

nl=$'\n'
touch $RELEASE_NOTES
echo "## Changes from [$PREV_TAG](https://github.com/GouravSna/$REPO_NAME/releases/tag/$PREV_TAG)$nl" > $RELEASE_NOTES

git log $PREV_TAG..HEAD --oneline --grep='(#' | cut -d' ' -f2- | while read -r line; do
    echo "$line"

    bugFixes="Bug Fixes"
    newFeatures="New Features"

    case $line in

      *"fix"*)
        grep -qF -- $bugFixes $RELEASE_NOTES || echo "### "$bugFixes$nl >> $RELEASE_NOTES
        modifiedLine=$(echo "$line" | sed 's/fix://')
sed -i '' '/'"$bugFixes"'/a\
'"- $modifiedLine$nl"'' $RELEASE_NOTES
        ;;

      *"feat"*)
        grep -qF -- $newFeatures $RELEASE_NOTES || echo "### "$newFeatures$nl >> $RELEASE_NOTES
        modifiedLine=$(echo "$line" | sed 's/feat://')
sed -i '' '/'"$newFeatures"'/a\
'"- $modifiedLine$nl"'' $RELEASE_NOTES
        ;;

      *)
        echo "### Additional Changes:" >> $RELEASE_NOTES
        echo "$line$nl" >> $RELEASE_NOTES
        ;;
    esac
done
