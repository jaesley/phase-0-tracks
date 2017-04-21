# OUR METHOD DECLARATIONS

# Encrypt
# Store alphabet variable
def encrypt(password)
# Loop through each letter of the password by index.
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encrypted = ""
  while index < password.length
# If the character is a space, skip it

# Otherwise advance that letter via index + 1
	  letter = password[index]
	  newindex = alphabet.index(letter)
# If the index + 1 is greater than 25 reset it back to 0
if newindex + 1 == alphabet.length
	      newindex = -1
	    end
	  newletter = alphabet[newindex + 1]
    encrypted[index] = newletter
	  index += 1
# Store the next letter in the variable
  end
  return encrypted
end

# puts encrypt(password)

# Decrypt
# Get the index of each letter of encrypted string
def decrypt(password)
# Store letter at index - 1 from the alphabet
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted = ""
  while index < password.length
    letter = password[index]
    newindex = alphabet.index(letter)
      if newindex - 1 == -1
        newindex = alphabet.length
      end
    newletter = alphabet[newindex -1]
    decrypted[index] = newletter
    index += 1
  end
  return decrypted
end

# puts decrypt(password)

# If you decrypt the encryption, you'll get the original back!
# puts decrypt(encrypt("swordfish"))

# OUR DRIVER CODE

# Asks a secret agent (the user) whether they would like to decrypt or encrypt a password
puts "Would you like to decrypt or encrypt a password?"

method = gets.chomp
# Asks them for the password
puts "What is your password?"

password = gets.chomp
# Conducts the requested operation, prints the result to the screen, and exits

if method == "encrypt"
  puts encrypt(password)
else 
  puts decrypt(password)
end