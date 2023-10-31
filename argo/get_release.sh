#!/bin/bash

# Obtiene el valor del git Release
release=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SaulMarcial/react-tekton-argo/releases/latest | jq -r .tag_name)

# Imprime el valor del Release
echo $release