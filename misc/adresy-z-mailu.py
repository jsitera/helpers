import re

filename1="email2.eml"

file1=open(filename1, "r")

#hardcoded and non flexible

while True:
  i = file1.readline()
  line = re.findall(r'^Bcc:', i)
  if line:
     list = i.split(",")
     list[0] = list[0][4:] #remove Bcc:
     list.pop() # remove newline
     for address in list:
       address = address.strip()
       tokens = re.findall(r'<(.*)>', address)
       if tokens:
          address = tokens[0]
       print(address)
     break

while True:
  i = file1.readline()
  line = re.findall(r'^ ', i)
  if line:
    list = i.split(",")
    list.pop()
    for address in list:
      address = address.strip()
      tokens = re.findall(r'<(.*)>', address)
      if tokens:
        address = tokens[0]
      print(address)
  else:
    break

file1.close()
