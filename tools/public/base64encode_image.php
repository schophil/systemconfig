<?php

$file = $argv[1];

function readImage(string $file): string
{
    return file_get_contents($file);
}

function encode(string $content): string
{
    return base64_encode($content);
}

echo encode(readImage($file));
