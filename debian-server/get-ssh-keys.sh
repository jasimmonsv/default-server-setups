#!/bin/bash
echo Provide GitHub/GitLab username:
read GIT_USER

curl -O https://github.com/github-$GIT_USER.keys
curl -O https://gitlab.com/gitlab-$GIT_USER.keys

mv ./github-$GIT_USER.keys ~/.ssh/authorized_keys
cat gitlab-$GIT_USER.keys >> ~/.ssh/authorized_keys
chmod 640 ~/.ssh/authorized_keys
rm ./*-$GIT_USER.keys
