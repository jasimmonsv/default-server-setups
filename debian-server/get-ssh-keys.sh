#!/bin/bash
echo Provide GitHub/GitLab username:
read GIT_USER

curl -O https://github.com/$GIT_USER.keys
mv ./$GIT_USER.keys ~/.ssh/authorized_keys
curl -O https://gitlab.com/$GIT_USER.keys
cat $GIT_USER.keys >> ~/.ssh/authorized_keys
chmod 640 ~/.ssh/authorized_keys
rm ./$GIT_USER.keys
