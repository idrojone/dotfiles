#!/usr/bin/env bash

# Terminar instancias previas de polybar
killall -q polybar

# Esperar a que los procesos se hayan cerrado
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar la barra usando tu archivo de configuración
polybar -c ~/.config/polybar/config-standard example &
#polybar -c ~/.config/polybar/config-nordic example &