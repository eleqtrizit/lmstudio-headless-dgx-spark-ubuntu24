#!/bin/sh

systemctl --user start xvfb-user.service
systemctl --user start lmstudio-user.service

