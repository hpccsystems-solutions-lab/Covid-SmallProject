EXPORT population := MODULE

  EXPORT filePath := '~univ::covid19::file::public::census::us_states_population.flat';
                       

  EXPORT layout := RECORD
      STRING location;
      REAL population;
  END;

  EXPORT ds := DATASET(filePath, layout, THOR);  

END;