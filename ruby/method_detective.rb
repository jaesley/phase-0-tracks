# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.
# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

"zom".gsub("o", "oo")
# => “zoom”

"enhance".center(15)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual".insert(-1, " suspects")
#=> "the usual suspects"

" suspects".prepend("the usual")
# => "the usual suspects"
# => This can also have been done with .insert as above, with an index of 0

"The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"
# => This can also have been done with .slice as below, with a range of 0..-2 or 0...-1

"The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

"How many times does the letter 'a' appear in this string?".count("a")
# => 4