# Climate-ADB
Supplementary data and code for manuscript 'Climate change and tree mortalities caused by ash dieback'

The database describes observed mortality and defoliation of ash trees due to ash dieback. All data is synthesised from 80 previous disease surveys. 

File - `AMD.csv`: annual mortality rate (%/yr) in each locality, with environmental variables during the disease period attached. 

File - `AMR.csv`: annual mean mortality (%/yr) in each locality, with environmental variables during the disease period attached.

List of variables:

* `Obs.year` - observation year
* `Length` - length of the period (yr) when disease progresses on the research site
* `LngLat` - longitude and latitude
* `T35` - mean spring (March-May) temperature (degree C)
* `P35` - spring precipitation (mm)
* `T68max` - maximum summer (June-August) temperature (degree C)
* `P68` - summar precipitation (mm)
* `T911` - mean autumn (September-November) precipitation (mm)
* `T122min` - minimum winter (December-February) temperature (degree C)

The code file applies a simple linear regression on the data.
