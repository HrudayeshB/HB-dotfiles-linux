#!/bin/bash

# Hardcoded filename
input_file="pass.txt"
encrypted_file="${input_file}.enc"

# Function to encrypt pass.txt
encrypt_file() {
    # Check if pass.txt exists
    if [ ! -f "$input_file" ]; then
        echo "Error: File '$input_file' not found!"
        exit 1
    fi

    echo "Enter the password to encrypt the file:"
    read -s password

    # Encrypt the pass.txt file using AES-256 with PBKDF2
    openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$input_file" -out "$encrypted_file" -k "$password"
    echo "File '$input_file' has been encrypted to '$encrypted_file'."
}

# Function to decrypt pass.txt.enc
decrypt_file() {
    # Check if pass.txt.enc exists
    if [ ! -f "$encrypted_file" ]; then
        echo "Error: Encrypted file '$encrypted_file' not found!"
        exit 1
    fi

    echo "Enter the password to decrypt the file:"
    read -s password

    # Decrypt the pass.txt.enc file using AES-256 with PBKDF2
    openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in "$encrypted_file" -out "$input_file" -k "$password"
    
    if [ $? -eq 0 ]; then
        echo "File '$encrypted_file' has been decrypted to '$input_file'."
    else
        echo "Error: Decryption failed. Please check the password or the file."
    fi
}

# Main script starts here
echo "Choose an option:"
echo "1) Encrypt pass.txt"
echo "2) Decrypt pass.txt.enc"
read choice

case $choice in
    1)
        encrypt_file
        ;;
    2)
        decrypt_file
        ;;
    *)
        echo "Invalid option. Please choose 1 to Encrypt or 2 to Decrypt."
        exit 1
        ;;
esac

