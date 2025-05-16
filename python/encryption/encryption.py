# This is an encryption + decryption program.

# Functions:

import random

# function that creates a and return a key (randomally created)
def make_enc_key():
    letters = 'abcdefghijklmnopqrstuvwxyz'
    shuffled = list(letters)
    random.shuffle(shuffled)

    enc_key = {}
    for i in range(len(letters)):
        enc_key[letters[i]] = shuffled[i]

    return enc_key

# accepts an enc_key and returns a dec key
def compute_dec_key(enc_key):
    dec_key = {}
    for key, value in enc_key.items():
        dec_key[value] = key
    return dec_key

# function that accepts some clear text and an enc_key, and returns encrypted text
def encrypt_text(text, enc_key):
    encrypted_text = ''
    for char in text:
        if char in enc_key:
            encrypted_text += enc_key[char]
        else:
            encrypted_text += char
    return encrypted_text

# function that accepts some encrypted text and a dec_key and returns clear text.
def decrypt_text(text, dec_key):
    decrypted_text = ''
    for char in text:
        if char in dec_key:
            decrypted_text += dec_key[char]
        else:
            decrypted_text += char
    return decrypted_text

def test_all():
    # Test the make_enc_key function
    enc_key = make_enc_key()
    print("Encryption Key: ", enc_key)

    # Test the compute_dec_key function
    dec_key = compute_dec_key(enc_key)
    print("Decryption Key: ", dec_key)

    # Test the encrypt_text function
    text = "hello world"
    encrypted_text = encrypt_text(text, enc_key)
    print("Encrypted Text: ", encrypted_text)

    # Test the decrypt_text function
    decrypted_text = decrypt_text(encrypted_text, dec_key)
    print("Decrypted Text: ", decrypted_text)

print("hello world!")
test_all()