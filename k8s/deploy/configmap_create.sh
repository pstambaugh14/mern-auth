#!/bin/bash
#kubectl -n development create configmap keys-config --from-file=../../config/keys.js
kubectl -n development create configmap keys-config --from-file=keys.js
