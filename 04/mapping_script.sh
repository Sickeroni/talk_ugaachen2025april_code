#!/bin/sh
cd /usr/include/c++/14.2.1/ && grep -r headername | perl -nle 'm/^([^:]+).*@headername\{([^,]*)\}/ && print qq@  { "include": ["<$1>", "private", "<$2>", "public"] },@' | sort -u