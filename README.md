# Climate-ADB
Supplementary data and code for manuscript 'Climate change and tree mortalities caused by ash dieback'

The database describes observed mortality and defoliation of ash trees due to ash dieback. All data is synthesised from 80 previous disease surveys. 

File - `AMD.csv`: annual mortality rate (%/yr) in each locality, with environmental variables during the disease period attached. 

File - `AMR.csv`: annual mean mortality (%/yr) in each locality, with environmental variables during the disease period attached.

List of climatic variables:

* `T78max` - maximum temperature from July to August (degree C)
* `T1min` - January minimum temperature (degree C)
* `P78` - precipitation from July to August (mm)
* `P456` - precipitation from April to June (mm)

The code file applies a simple linear regression on the data.
