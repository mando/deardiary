#!/bin/bash

set -e

FILEDIR=$HOME/.diary
TODAY=$(date +"%Y-%m-%d")
TODAYS_FILE=$FILEDIR/today-$TODAY.txt
EDITOR=$EDITOR

ask_for_editor() {
  echo "Looks like \$EDITOR isn't set"
  echo  "  (don't feel bad - I forgot to set it too)."
  echo ""
  echo "Please enter your editor of choice, or just hit enter and we'll use \`vi\`:"
  read EDITOR

  if [ -z "${EDITOR}" ]; then
    EDITOR="vi"
  fi
}

setup() {
  if [ ! -d "${FILEDIR}" ]; then
    mkdir -p $FILEDIR
  fi

  if [ ! -f "${TODAYS_FILE}" ]; then
    touch ${TODAYS_FILE}
  fi

  if [ -z "${EDITOR}" ]; then
    ask_for_editor
  fi
}

open_todays_diary() {
  setup
  $EDITOR $TODAYS_FILE
}

open_todays_diary
