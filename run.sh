
if [ ! -n "$WERCKER_GIT_MERGE_SOURCE" ]; then
  fail 'Please specify source property'
fi

if [ ! -n "$WERCKER_GIT_MERGE_TARGET" ]; then
  fail 'Please specify target property'
fi

if [! -n "$WERCKER_GIT_MERGE_BOT_NAME"]; then
  WERCKER_GIT_MERGE_BOT_NAME = $(git config --get user.name);
fi

if [! -n "$WERCKER_GIT_MERGE_BOT_EMAIL"]; then
  WERCKER_GIT_MERGE_BOT_EMAIL = $(git config --get user.email);
fi

regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"

if [[ ! $WERCKER_GIT_MERGE_BOT_EMAIL =~ $regex ]] ; then
  fail 'Please use a valid email address for your git bot email.'
fi

cd "$WERCKER_ROOT" || fail "could not change directory to source_dir \"$WERCKER_ROOT\""
git config user.email "$WERCKER_GIT_MERGE_BOT_EMAIL"
git config user.name "$WERCKER_GIT_MERGE_BOT_NAME"

git remote update origin || fail "could not fetch branches from the remote"

git checkout -B "$WERCKER_GIT_MERGE_TARGET" "origin/$WERCKER_GIT_MERGE_TARGET" || fail "could not checkout $WERCKER_GIT_MERGE_TARGET"

git merge --no-ff "origin/$WERCKER_GIT_MERGE_SOURCE" || fail "could not merge $WERCKER_GIT_MERGE_SOURCE into $WERCKER_GIT_MERGE_TARGET"

git push origin "$WERCKER_GIT_MERGE_TARGET" || fail "could not push $WERCKER_GIT_MERGE_TARGET"
