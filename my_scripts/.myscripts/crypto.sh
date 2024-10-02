#!/bin/bash

# Function to encrypt a file
encrypt_file() {
    echo "Enter the name of the file to encrypt:"
    read input_file

    # Check if file exists
    if [ ! -f "$input_file" ]; then
        echo "Error: File '$input_file' not found!"
        exit 1
    fi

    # Automatically append .enc to the output file name
    output_file="${input_file}.enc"

    echo "Enter the password to encrypt the file:"
    read -s password

    # Encrypt the file using AES-256 with PBKDF2
    openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$input_file" -out "$output_file" -k "$password"
    echo "File '$input_file' has been encrypted to '$output_file'."
}

# Function to decrypt a file
decrypt_file() {
    echo "Enter the name of the encrypted file to decrypt:"
    read input_file

    # Check if file exists
    if [ ! -f "$input_file" ]; then
        echo "Error: File '$input_file' not found!"
        exit 1
    fi

    # Automatically remove .enc from the output decrypted file name
    output_file="${input_file%.enc}"

    echo "Enter the password to decrypt the file:"
    read -s password

    # Decrypt the file using AES-256 with PBKDF2
    openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in "$input_file" -out "$output_file" -k "$password"
    
    if [ $? -eq 0 ]; then
        echo "File '$input_file' has been decrypted to '$output_file'."
    else
        echo "Error: Decryption failed. Please check the password or the file."
    fi
}

# Main script starts here
echo "------------------"
echo "Choose an option:"
echo "1) Encrypt a file"
echo "2) Decrypt a file"
echo "------------------"
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

