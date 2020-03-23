#!/bin/bash
#kubectl -n development create configmap keys-config --from-file=../../config/keys.js
#kubectl -n development create configmap keys-config --from-file=keys.js
#kubectl -n development create configmap keys-config --from-file=keys.js=keys --from-file=passport=passport.js
kubectl -n development create configmap keys-config --from-file=keys.js --from-file=keys.js

