<?php

echo "Hashing {$argv[1]}\n";
echo hash('sha1', $argv[1]);
echo "\n";
