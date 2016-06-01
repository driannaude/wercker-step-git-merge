
if [ ! -n "$WERCKER_GIT_MERGE_SOURCE" ]; then
  fail 'Please specify source property'
fi

if [ ! -n "$WERCKER_GIT_MERGE_TARGET" ]; then
  fail 'Please specify target property'
fi

cd "$WERCKER_ROOT" || fail "could not change directory to source_dir \"$WERCKER_ROOT\""

git remote update origin || fail "could not fetch branches from the remote"

git checkout -B "$WERCKER_GIT_MERGE_TARGET" "origin/$WERCKER_GIT_MERGE_TARGET" || fail "could not checkout $WERCKER_GIT_MERGE_TARGET"

git merge --no-ff "origin/$WERCKER_GIT_MERGE_SOURCE" || fail "could not merge $WERCKER_GIT_MERGE_SOURCE into $WERCKER_GIT_MERGE_TARGET"

git push origin "$WERCKER_GIT_MERGE_TARGET" || fail "could not push $WERCKER_GIT_MERGE_TARGET"
