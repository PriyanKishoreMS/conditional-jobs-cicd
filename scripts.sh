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

SERVICE1_CHANGED=$(if git diff --quiet --exit-code  236e7813fc1084c1fc4cb206cc4221d4be40baf1^1 236e7813fc1084c1fc4cb206cc4221d4be40baf1 -- 'serverless-start/'; then
  echo false
else
  echo true
fi)
echo "SERVICE1_CHANGED=${SERVICE1_CHANGED}"

# git diff 236e7813fc1084c1fc4cb206cc4221d4be40baf1^1 236e7813fc1084c1fc4cb206cc4221d4be40baf1 -- 'serverless-extra/'

# 86db23eed81b53dde2f66abc1a9bc3408f80fc6a
# dcb9ee1d81e4cc670a33026931945c20feefeca4
# a2e18ba596c6f61dff420b53c613df98a562976a