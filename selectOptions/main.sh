#!/usr/bin/env bash

# Exit on unset variable
set -u

. ./choose_from_options.sh

options=(Jarvis Drax LTV)

choose_from_options ${options[@]} 

echo $selected_option
