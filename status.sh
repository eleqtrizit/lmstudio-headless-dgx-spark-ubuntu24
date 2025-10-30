#!/bin/sh

systemctl --user status lmstudio-user.service | cat
systemctl --user status xvfb-user.service | cat
