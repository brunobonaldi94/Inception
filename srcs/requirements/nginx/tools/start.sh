#!/bin/bash

nginx -t

/etc/init.d/nginx reload

nginx -g "daemon off;"