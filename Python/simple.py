print ("Here we go!")

f = open("test.txt","a")
f.write ("\n"+"i=114")
f.write ("\n G_114 <= 115")
f.write ("\n A_114 <= (3 G_114)/(108)" )
f.write ("\n")
f.close()

for i in range (113,14,-1):
 f = open("test.txt","a")
 f.write ("\n"+"% i="+str(i))
 f.write ("\n G_"+str(i)+" <= "+str(i+1))
 f.write ("\n G_"+str(i)+" <= "+str(i+2)+" - ("+str(i+1-6)+" A_"+str(i+1)+")/3")
 f.write ("\n A_"+str(i)+" <= (3 G_"+str(i)+")/("+str(i-6)+")")
 f.write ("\n")
 f.close()

# f = open("test.txt", "a")
# f.write("\n"+"Now the file has more content!")
# f.close()
#
# #open and read the file after the appending:
# f = open("test.txt", "r")
# print(f.read())
