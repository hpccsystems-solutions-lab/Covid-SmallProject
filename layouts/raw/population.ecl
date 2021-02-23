/*
    Get the data here:    
    https://www2.census.gov/programs-surveys/popest/tables/2010-2018/state/asrh/sc-est2018-agesex-civ.csv
    2.Upload the file to the landing zone of an HPCC cluster using ECL Watch
    3.Spray the data on cluster by using the delimited option with the following parameters
            scope=~univ::covid19::file::raw::census
            name=us_state_population.csv     
*/

EXPORT population := MODULE

  EXPORT filePath := '~univ::covid19::file::raw::census::sc-est2018-agesex-civ.csv';  
                       

  EXPORT layout := RECORD
    STRING SUMLEV;
    STRING REGION;
    STRING DIVISION;
    STRING STATE;
    STRING NAME;
    STRING SEX;
    STRING AGE;
    STRING ESTBASE2010_CIV;
    STRING POPEST2010_CIV;
    STRING POPEST2011_CIV;
    STRING POPEST2012_CIV;
    STRING POPEST2013_CIV;
    STRING POPEST2014_CIV;
    STRING POPEST2015_CIV;
    STRING POPEST2016_CIV;
    STRING POPEST2017_CIV;
    STRING POPEST2018_CIV;
  END;


  EXPORT ds := DATASET(filePath, layout, CSV(HEADING(1)));  


END;