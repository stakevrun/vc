#!/usr/bin/env fish
set args (string split - $argv[1])
set network $args[1]
set port $args[2]
set bnports (cat "/usr/share/vrün/bnports-$network")
exec lighthouse vc \
  --network=$network \
  --beacon-nodes=(string replace --regex "^" "http://localhost:" $bnports | string join ',') \
  --datadir=/var/lib/vrunvc-$argv[1] \
  --http --http-port=$port \
  --broadcast=subscriptions,attestations,blocks,sync-committee \
  --builder-proposals --prefer-builder-proposals \
  --disable-log-timestamp
