# morsecode
## Introduction
The implementation of Morse code using Cyclone II FPGA and a 4X4 button matrix as input is a project that aims to showcase the practical application of digital communication systems. Morse code is a binary system that employs dots and dashes to represent letters and numbers, and this project seeks to investigate how to convert these signals using FPGA technology and make audible tone of the corresponding alphabet uisng a buzzer. The use of a button matrix as input provides a simple and intuitive means of inputting Morse code messages, rendering it an excellent educational tool for novice learners of Morse code. Overall, this project presents a remarkable opportunity to gain insight into FPGA technology, digital communication systems, and Morse code while building a practical and engaging project.

In morse Code a ```. (dot)``` take 48ms and a ```_ (dash)``` take 144ms and inter symbol delay is 48ms thus and external clock of period 48ms was provided using a simple blink sketch in Arduino.

## Component used
- Altera Cyclone II FPGA
- USB blaster JATAG programmer
- 4X4 button matrix
- 4X 1K ohm resistors
- Arduino uno( as a clock input)
- buzzer
- connecting wires

## Software Used
- [Intel Quartus II Web Edition](https://www.intel.com/content/www/us/en/software-kit/666221/intel-quartus-ii-web-edition-design-software-version-13-1-for-windows.html)

## Schematic diagram
![schematic diagram](/images/schematic.jpg?raw=true "Title") 

## Pin Discpition 

| Pin Name | Pin Number | Input/Output |
|----------|------------|--------------|
| A        | 40         | Input        |
| B        | 42         | Input        |
| C        | 44         | Input        |
| D        | 47         | Input        |
| Buzzer   | 3          | Output       |
| Clock    | 7          | Input        |



A screenshot of pin assignment in Quartus II  
![pinout](/images/pinout.jpg?raw=true "Title") 


## RTL Synthesis 


![synthesis](/images/synthesis.jpg?raw=true "Title") 


 

