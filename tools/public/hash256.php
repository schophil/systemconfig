<?php

echo "Hashing {$argv[1]}\n";
echo hash('sha256', $argv[1]);
echo "\n";