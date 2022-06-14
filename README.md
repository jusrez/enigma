# Enigma

**Functionality**

- The *Enigma* class contains an encrypt and decrypt method that can successfully encrypt and decrypt messages in accordance with the interaction pattern provided. The encrypt/decrypt command line interfaces have also successfully been implemented.

Self Assessment Score : 3.0 / 4.0

**Object Oriented Programming**

- I created a module called *Calculable* to contain all of the methods needed to calculate values that could/would be needed by the encrypt/decrypt methods. On my first run through, these helper methods were all contained within the Enigma class. It looked a lot more organized when those methods were moved over to the module. I considered creating a superclass that Enigma could access these methods from, but it seemed pointless since superclasses share state and behavior. I didn't really need access to state since there weren't any attributes I needed access to (I added the character set as an attribute since every instance of Enigma would need it), so it made sense to just use a module(since I only needed access to behavior).

Self Assessment Score: 4.0 / 4.0

**Ruby Conventions and Mechanics**

- I believe the code is properly indented and syntax is consistent. The encrypt and decrypt methods are both 11 lines long. They were previously shorter because the if statements I previously used were on the same line of code I was using to add an encrypted key and decrypted key. The lines were very long and roughly >120 characters, so I wrote the if statements the traditional way. I was able to get some fancy enumerables into the code (each_cons, each_index, with_index). I actually didn't use each once.

Self Assessment Score: 3.5 / 4.0

**Test Driven Development**

- I didn't use any mocks and/or stubs while testing, but I did test edge cases like messages in all caps or special characters. SimpleCov shows 100% coverage.

Self Assessment Score: 3.0 / 4.0

**Version Control**

- After this final commit, I'll officially be at 40 commits and more than 4 pull requests. I believe that all pull requests are related and contain logical chunks of functionality.

Self Assessment Score : 4.0 / 4.0
