#!/bin/bash
(eww close $1 || eww open $1) >/dev/null 2>&1
