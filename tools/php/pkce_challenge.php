<?php

function createChallenge(string $value): string
{
    $data = base64_encode(hash('sha256', $value, true));
    return rtrim(strtr($data,'+/','-_'),'=');
}

echo 'Creating sha256 challenge with ' . $argv[1] . "\n";
echo createChallenge($argv[1]);
echo "\n";
