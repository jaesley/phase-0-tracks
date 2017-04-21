# Encrypt
# Store alphabet variable
password = "zed"
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

puts encrypt(password)

# Decrypt
# Get the index of each letter of encrypted string
# Store letter at index - 1 from the alphabet