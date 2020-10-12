function @pforward
  socat -v TCP-LISTEN:$argv[1],fork TCP:$argv[2]
end
