#!/bin/bash

random_set_wallpaper() {
  while true; do
    feh --randomize --bg-fill ~/.wallpaper/image/*
    sleep 60
  done
}

random_set_wallpaper &
