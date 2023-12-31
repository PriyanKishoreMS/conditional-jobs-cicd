#!/bin/bash
# SERVICE1_CHANGED=$(if git diff --name-only 014120375419ff3ac63a75a3fdbd8718680dcc91..origin/main | grep '^serverless-start/'; then echo true; else echo false; fi) \
# echo "here=$SERVICE1_CHANGED"

# if git diff-index --quiet HEAD --; then
#     # No changes
#     echo "No changes"
# else
#     echo "Changes"
# fi


# SERVICE1_CHANGED=$(if git diff --quiet 014120375419ff3ac63a75a3fdbd8718680dcc91 a2e18ba596c6f61dff420b53c613df98a562976a -- 'serverless-start/'; then echo true; else echo false; fi)
#     echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}" 

# git diff a2e18ba596c6f61dff420b53c613df98a562976a dcb9ee1d81e4cc670a33026931945c20feefeca4 -- 'serverless-start/' 

# if git diff --quiet --exit-code 86db23eed81b53dde2f66abc1a9bc3408f80fc6a^1 86db23eed81b53dde2f66abc1a9bc3408f80fc6a -- 'serverless-start/'; then
#   echo "No changes"
# else
#   echo "Changes detected"
# fi
# -------------------------------------------------------
# SERVICE1_CHANGED=$(if git diff --quiet --exit-code  ca7f66bce1aec529c2e3410fdfb574a6720953fc^1 ca7f66bce1aec529c2e3410fdfb574a6720953fc -- 'serverless-extra/'; then
#   echo false
# else
#   echo true
# fi)
# echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}"
# -------------------------------------------------------
# SERVICE1_CHANGED=false

# for COMMIT in $(git rev-list HEAD); do
#   if git diff --quiet --exit-code $COMMIT^1 $COMMIT -- 'serverless-start/'; then
#     echo "No changes in commit $COMMIT for 'serverless-start/'"
#   else
#     echo "Changes detected in commit $COMMIT for 'serverless-start/'"
#     SERVICE1_CHANGED=true
#     break
#   fi
# done

# echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}"

# -------------------------------------------------------

# git diff 236e7813fc1084c1fc4cb206cc4221d4be40baf1^1 236e7813fc1084c1fc4cb206cc4221d4be40baf1 -- 'serverless-extra/'

# 86db23eed81b53dde2f66abc1a9bc3408f80fc6a
# dcb9ee1d81e4cc670a33026931945c20feefeca4
# a2e18ba596c6f61dff420b53c613df98a562976a

# curl -s "https://api.github.com/repos/PriyanKishoreMS/conditional-jobs-cicd/compare/a2e18ba596c6f61dff420b53c613df98a562976a...fcf0a52414885c503e0842a02391961de6cbc376" | jq -r '.commits'


# CHANGED_COMMITS=$(curl -s "https://api.github.com/repos/PriyanKishoreMS/conditional-jobs-cicd/compare/fcf0a52414885c503e0842a02391961de6cbc376...a01cc31a4bf9f8a5d02fc5ddce226ffd515ee519" | jq -r '.commits[].sha')
  
#    SERVICE1_CHANGED=false
#    for COMMIT in $CHANGED_COMMITS; do
#      if git diff --quiet --exit-code $COMMIT^1 $COMMIT -- 'serverless-start/'; then
#        echo "No changes in commit $COMMIT for 'serverless-start/'"
#      else
#        echo "Changes detected in commit $COMMIT for 'serverless-start/'"
#        SERVICE1_CHANGED=true
#        break
#      fi
#    done
  
#    echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}"

CHANGED_COMMITS=$(curl -s "https://api.github.com/repos/PriyanKishoreMS/conditional-jobs-cicd/compare/86db23eed81b53dde2f66abc1a9bc3408f80fc6a...a01cc31a4bf9f8a5d02fc5ddce226ffd515ee519" | jq -r '.commits[].sha')

echo "CHANGED_COMMITS=${CHANGED_COMMITS}"

SERVICE1_CHANGED=false
for COMMIT in $CHANGED_COMMITS; do
  echo "Commit $COMMIT"
  FILES_CHANGED=$(curl -s "https://api.github.com/repos/PriyanKishoreMS/conditional-jobs-cicd/commits/$COMMIT" | jq -r '.files | map(select(.filename | startswith("serverless-start/"))) | length')
  echo "Commit $COMMIT has $FILES_CHANGED files in 'serverless-start/'"
  
  if [ "$FILES_CHANGED" -gt 0 ]; then
    echo "Changes detected in commit $COMMIT for 'serverless-start/'"
    SERVICE1_CHANGED=true
    break
  else
    echo "No changes in commit $COMMIT for 'serverless-start/'"
  fi
done

echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}"
