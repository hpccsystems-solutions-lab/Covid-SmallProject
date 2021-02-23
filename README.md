# Processing Covid 19 Vaccination Data

The successful vaccination of the general population of the world for Covid 19 is the only viable solution that can help us prevent the spread of Covid 19, and ultimately help us save precious lives. It is estimated that we would need 80% or more of the population vaccinated to prevent the spread of the disease. As we have realized, the process of vaccination rollout and then execution is nothing but straightforward. 

As we start to understand the data of the vaccine rollout, there are several opportunities that can help us better understand of how the virus can be tamed and ultimately defeated. Hence, we seek your help and creativity to understand the data and then produce meaningful analysis that can help authorities, doctors, schools and business owners to help prevent the loss of lives.  

# The Data

For this project, we will use the amazing work of collecting the vaccine data conducted by OWID (Our World In Data, https://ourworldindata.org/). We will focus on the United States and the data at the state level as US is leading the charge in reporting this data correctly.

# The directory organization of this project

- **layouts/raw** = Contains data definitions of all raw data sources. Start here as you will need to download and use these sources. 
- **layouts/public** = Contains data definitions of what we think we need. Please put your creativity to use here by adding to the elements we have started with
- **etl**= Contains the code that cleans the raw data and creates the public versions
- **analysis**= Contains the code to calculate metrics that might be useful to someone (ultimately)

# How will you navigate the project

- First, consider the vaccine data source
- Start at layouts/raw/vaccine.ecl and understand the data source. Understand why we created the definitions in these files.
- Go to the layouts/public/vaccine.ecl and understand the design. Do you want to add any other attributes than we have already considered?
- Go to the etl/clean_vaccine.ecl and understand the clean logic. Do you want to add anything?
- Repeat the above steps for the next data source which is the population data
- Once we have the data sources and the cleaned data, it is time to perform some analytics. Start with the output definition layouts/public/metrics
- Go to analysis/metrics.ecl and understand the code. What else can we do? HINT #1: It looks like some of the states (e.g. AMERICAN SAMOA) data is not correct? why?

# Finally

Happy Data Analysis! Remember, with ECL and HPCC, you are not coding really. You are trying to understand the data and performing analysis. ECL just provides the vehicle for you to do this quickly without worrying about the scale and complexity of the data. This project covers the ECL patterns: PROJECT, ITERATE, SORT, JOIN and ROLLUP. We hope you enjoy the work and are able to contribute with your own ideas.




