#!/bin/bash

# Obtiene el valor del git Release
release=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SaulMarcial/node-web-app/releases/latest | grep tag_name | awk -F'"' '{print $4}')

# Imprime el valor del Release
echo $release