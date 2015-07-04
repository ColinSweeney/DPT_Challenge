#!/usr/bin/python

#Authored by Colin S.
#
#Future Fixes:
#  1. Restrict to only one input parameter
#  2. Optimize Calculations

import sys, getopt, math

fahrVal=0
celVal=0
kelVal=0
ranVal=0
delVal=0
newtVal=0

def convert(format, inputval):
    global fahrVal
    global celVal
    global kelVal
    global ranVal
    global delVal
    global newtVal

# Considered adding logic to take advantage of easy conversions, but arthimetic calculations are trivial in this situation.
# Newton <-> Celcius <-> Kelvin <-> Rankine <-> Fahrenheit conversions all require only one arithmetic operation.
# Delisle is the only extended conversion because Frenchmen.
    
    if format in ['f','fahrenheit']:
        fahrVal=inputval
        celVal=str((float(fahrVal)-32)*float(5)/9)
        ranVal=str(float(fahrVal)+float(459.67))
        kelVal=str(float(ranVal)*float(5)/9)
        delVal=str((212-float(fahrVal))*float(5)/6)
        newtVal=str(float(celVal)*float(33)/100)
    elif format in ['c','celcius']:
        celVal=inputval
        fahrVal=str(float(celVal)*(float(9)/5)+32)
        kelVal=str(float(celVal)+float(273.15))
        ranVal=str(float(kelVal)*float(9)/5)
        delVal=str((float(100)-float(celVal))*float(3)/2)
        newtVal=str(float(celVal)*float(33)/100)
    elif format in ['k', 'kelvin']:
        kelVal=inputval
        ranVal=str(float(kelVal)*float(9)/5)
        celVal=str(float(kelVal)-float(273.15))
        fahrVal=str(float(ranVal)-459.67)
        delVal=str((float(373.15)-float(kelVal))*float(3)/2)
        newtVal=str(float(celVal)*float(33)/100)
    elif format in ['r', 'rankine']:
        ranVal=inputval
        fahrVal=str(float(ranVal)-float(459.67))
        celVal=str((float(ranVal)-float(491.67))*float(5)/9)
        kelVal=str(float(ranVal)*float(5)/9)
        delVal=str((float(671.67)-int(ranVal))*float(5)/6)
        newtVal=str(float(celVal)*float(33)/100)
    elif format in ['d', 'delisle']:
        delVal=inputval
        fahrVal=str((212-int(delVal))*float(6)/5)
        ranVal=str(float(-459.67)+float(fahrVal))
        kelVal=str(float(ranVal)*float(5)/9)
        celVal=str(float(kelVal)-float(273.15))
        newtVal=str(float(celVal)*float(33)/100)
    elif format in ['n', 'newton']:
        newtVal=inputval
        celVal=str(float(newtVal)*float(100)/33)
        kelVal=str(float(celVal)+float(273.15))
        ranVal=str(float(kelVal)*float(9)/5)
        fahrVal=str(float(ranVal)-float(459.67))
        delVal=str((212-float(fahrVal))*float(5)/6)






def main(argv):
    global fahrVal
    global celVal
    global kelVal
    global ranval
    global delVal
    global newtVal

    try:
        opts, args = getopt.getopt(argv,"f:c:k:r:d:n:",["inVal="])
    except getopt.GetoptError:
        print 'Invalid input.'
        print 'main.py [-option] <inputNumber>'
        print 'Available options: -f -c -k -r -d -n'
        sys.exit(2)
   
    for opt, arg in opts:
#Some Error Handling
        try:
            verifyNum = float(arg)
        except ValueError:
            print 'Second Parameter is not a valid number: ', arg
            sys.exit(2)

        if opt == '-h':
            print 'main.py [-option] <inputNumber>'
            sys.exit()
        elif opt in ("-f", "--inVal"):
            convert('f', arg)
        elif opt in ("-c", "--inVal"):
            convert('c', arg)
        elif opt in ("-k", "--inVal"):
            convert('k', arg)
        elif opt in ("-r", "--inVal"):
            convert('r', arg)
        elif opt in ("-d", "--inVal"):
            convert('d', arg)
        elif opt in ("-n", "--inVal"):
            convert('n', arg)

    print 'Celcius Value is: ', celVal
    print 'Fahrenheit Value is: ', fahrVal
    print 'Kelvin Value is: ', kelVal
    print 'Rankine Value is: ', ranVal
    print 'Delisle Value is ', delVal
    print 'Newton Value is ', newtVal
    
if __name__ == "__main__":
   main(sys.argv[1:])
