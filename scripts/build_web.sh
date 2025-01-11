#!/bin/bash
echo "Iniciando build do app web"

flutter clean && \
flutter build web --wasm --dart-define-from-file=.env && \
firebase deploy --only hosting

echo "Termino da geração build do app Android"