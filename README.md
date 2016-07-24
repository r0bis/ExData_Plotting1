Coursework 1
=====================================================

This is coursework Nr. 1 for the Exploratory Data Analysis course. Deadline is _BEFORE July 24, 11:59 PM PDT on Sunday_.

**Objective:** Create 4 R scripts that would produce 4 plots, using base graphics in R.

**Data:** Household Electric Power consumption (**link:** <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a>)

**Data set dimensions:** ~ 2.1 million rows of 9 columns.

**Data specifics:** per minute observations over the course of several years.

### Tasks:
1. Read data and subset 2 consecutive dates of observations to work on.
  * Dates are: 1st and 2nd of February, 2007
  * Subsetting may take place before reading, or after it.
2. Plot 1 - Histogram of "Global Active Power" (GAP) measurements.
3. Plot 2 - Line graph of GAP measurements over time
4. Plot 3 - Line graph of 3 Energy Sub Metering readings over time - the three lines are superimposed, and there must be a legend, showing what the lines are.
5. Plot 4 - contains 4 smaller plots
  * Plot 4.1 GAP over time (as plot 2)
  * Plot 4.2 Voltage over time
  * Plot 4.3 Sub metering over time (as Plot 3)
  * Plot 4.4 Global Reactive Power over time 

Description of steps:
--------------------------------------------
 1. The data file is downloaded and put in directory `data` that is at the same level as the repository (please see file tree structure below). This is done for data to remain outside the GitHub repository. The file is read from `../data/household_power_consumption.txt`
 	* please note that for your convenience the scripts will work also if you place the data file in the same directory where you run the script from.
 2. Each script reads the data, subsetting the two days during the reading process.
 	*  reading is done using `sqldf` package function `read.csv.sql()`
 3. In each script the `Date` and `Time` values are concatenated in a new column called `dateTime` and converted to Date type
 	* conversions are easy to do using `lubridate` package
 5. Each script then creates its specific output file in PNG format of 480 x 480 pixels
 	* plot1.R => plot1.png
 	* plot2.R => plot2.png
 	* plot3.R => plot3.png
 	* plot4.R => plot4.png


**Please note:** each script file reads the data independently. When I wrote the script for the first time, I did it to contain all the 4 grpahs. The original file that does all the 4 graphs with one data read is called `coursework_1.R`

Directory Structure
----------------------------
<pre>
.
├── ExData_Plotting1
│   ├── exdata-data-household_power_consumption.zip
│   └── household_power_consumption.txt
└── repo
    ├── coursework_1.R
    ├── plot1.png
    ├── plot1.R
    ├── plot2.png
    ├── plot2.R
    ├── plot3.png
    ├── plot3.R
    ├── plot4.png
    ├── plot4.R
    └── README.md
</pre>
