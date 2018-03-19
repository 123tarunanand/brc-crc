# Finding the Best 32 bit Divisor for Encoding Using CRC
### MATLAB Implementation 

## 1. Brief
CRC provides great error detection if the right divisor is chosen. This project aims to find the best divisor by plotting a graph of divisor size vs error detection percentage for 1,2 and 3 bit errors in data of length 32 bits i.e. 1 word.
CRC provides correction of 1 bit errors however in works only in special cases of divisors.

## 2. Divisor's Chosen
  We chose divisors such that some of them violated the rules for good divisors laid out in the book *Data Communication and Networking by Behrouz A Forouzan*.
  The rules have been copied onto here:
  > A good polynomial generator needs to have the following characteristic
  > 1. It should have at least two terms.
  > 2. The coefficient of the term x^0 should be 1.
  > 3. It should not divide x^t + 1, for t between 2 and n - 1.
  > 4. It should have the factor x + 1.  
  
  The divisors chosen for the study were:  
    1. 01000000  
    2. 01400000  
    3. 10000001  
    4. 18800000  
    5. 0C000006  
    6. 18000003  
    7. 04C11DB7  
    8. 00000103  
    9. 00000022  
    10. 747E9A33  


## 3. Data-word Chosen
  For the study we chose a sufficiently large data word of 4 bytes representing an integer value - _0x56F1361A_.

## 4. Types of Errors Analyzed
* 1 bit error
* 2 bit error
* 3 bit error
This analysis was performed by finding errors in all possible combinations in the data-word hence we chose:
  1. **64c1** cases for 1-bit errors.
  2. **64c2** cases for 2-bit errors.
  3. **64c3** cases for 3-bit errors.  
These large number of cases allowed us to have a good amortized analysis for error detection.

## 5. Description of Files
  * **main.m**: function to get all the pieces of codes working together.
  * **err.m** : contains logic for introducing errors into the data.
  * **errdet.m** : contains logic for error detection.
  * **CRCgen.m** : helper function to introduce error and then try to detect
  * **crc32.m** : funciton to calculate the checksum value.
  * **datagen.m** : function to generate a random data in a certain range.
  * **polys** : contains all the polynomials being utilized

## 6. Graphs Obtained
  For the polynomials we analyzed, we obtained a histogram showing the error detection percentage for each of them.
  ![Graph for 1, 2 and 3 bits of error detection](/images/bars1-2-3.jpg)
  
## 7. Softwares Used
  * Matlab
  * Octave

## 8. Contributors
* Tarun Anand 16CO147
* Archit Pandey 16CO153
