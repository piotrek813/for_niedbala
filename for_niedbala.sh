#!/bin/bash

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

declare -a arr=("Jakub Baran"
"Damian Brudkowski"
"Aleksander Czarnowski"
"Wiktor Górecki"
"Łukasz Jagiełło"
"Wiktor Kaczyński"
"Mateusz Kaza"
"Bartłomiej Kozłowski"
"Maciej Królikiewicz"
"Maciej Królikowski"
"Antoni Kucharczyk"
"Adam Laskowski"
"Piotr Smoliński"
"Jakub Sterczewski"
"Małgorzata Stypa"
"Paweł Gontowski")

path=$(realpath "$1")
rm -rf for_niedbala
mkdir for_niedbala
cd for_niedbala || exit
mkdir finished
unzip "$path" -d tmp
cd tmp || exit

for i in "${!arr[@]}"
do
  if [[ "$i" == 0 ]]; then
    change="Jan Kowalski";
  else
    change="${arr[$i-1]}"
  fi

  if [[ "${arr[$i]}" == "Paweł Gontowski" ]]; then
    sed -i 's/4PTB/4PTA/g' word/document.xml
  fi
  sed -i "s/$change/${arr[$i]}/g" word/document.xml
  zip -r "../finished/Dzienniczek Praktyki Zawodowej ${arr[$i]} 35 dni.docx" ./*
done


