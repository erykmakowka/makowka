#!/bin/bash

echo "Dodawanie użytkownika do grupy"

# zapytaj o grupe
echo "Proszę podaj nazwę grupy:"
read grupa
# Tworzenie grupy.
sudo addgroup $grupa
# Tworzenie użytkownika.

echo "Podaj nazwę użytkownika"
read login
# Dodawanie nowego użytkonika do grupy.
sudo useradd -m -g ${grupa} -s /bin/bash ${login}
