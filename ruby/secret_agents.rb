# OUR METHOD DECLARATIONS

# 1. Encrypt

def encrypt(password)

# Store starting point index, alphabet, and blank encrypted variable

  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encrypted = ""

# Loop through each letter of the password starting at index.

  while index < password.length

# If the character is a space, skip it

# Otherwise store newindex as the alphabetical index of the current password letter

		newindex = alphabet.index(password[index])

# If the newindex + 1 equals the alphabet length reset index back to -1
# so 'z' will become 'a'

			if newindex + 1 == alphabet.length
				newindex = -1
	    end

# Set encrypted[index] to the next letter of the alphabet

    encrypted[index] = alphabet[newindex + 1]

# Raise index by 1 and start next iteration

	  index += 1
	end

# After all letters have been adjusted, return encrypted
  
  return encrypted
end

# Decrypt

def decrypt(password)

# Store starting point index, alphabet, and blank encrypted variable

  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted = ""

# Loop through each letter of the password starting at index.

  while index < password.length

# If the character is a space, skip it

# Otherwise store newindex as the alphabetical index of the current password letter

    newindex = alphabet.index(password[index])

# If the newindex - 1 equals -1 reset index back to alphabet length
# so 'a' will become 'z'
      if newindex - 1 == -1
        newindex = alphabet.length
      end

# Set decrypted[index] to the previous letter of the alphabet

    decrypted[index] = alphabet[newindex - 1]

# Raise index by 1 and start next iteration

    index += 1
  end

# After all letters have been adjusted, return encrypted

  return decrypted
end

# If you decrypt the encryption, you'll get the original back!
# puts decrypt(encrypt("swordfish"))
# returns:
# "swordfish"

# OUR DRIVER CODE

# Asks a secret agent (the user) whether they would like to decrypt or encrypt a password

puts "Would you like to decrypt or encrypt a password?"
method = gets.chomp.downcase

# Prompts again if input is not 'encrypt' or 'decrypt'.

until method == "encrypt" || method == "decrypt"
	puts "I didn't understand that. Would you like to decrypt or encrypt a password?"
	method = gets.chomp.downcase
end

# Asks them for the password

puts "What is your password?"
password = gets.chomp

# Prints the requeseted operation's result to the screen

if method == "encrypt"
  puts encrypt(password)
else 
  puts decrypt(password)
end