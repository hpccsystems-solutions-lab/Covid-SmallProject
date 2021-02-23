IMPORT STD;

EXPORT vaccine := MODULE 
    /* 
       The layout of the clean vaccine file. The file is generated
       using the clean_vaccine.ecl
     */  
    
    EXPORT filePath := '~univ::covid19::file::public::owid::us_states_vaccinations.flat';

    EXPORT layout := RECORD
        STD.Date.Date_t date;
        STRING location;
        UNSIGNED4 total_vaccinations;
        UNSIGNED4 total_distributed;
        UNSIGNED4 people_vaccinated;
        DECIMAL people_fully_vaccinated_per_hundred;
        DECIMAL total_vaccinations_per_hundred;
        UNSIGNED4 people_fully_vaccinated;
        DECIMAL people_vaccinated_per_hundred;
        DECIMAL distributed_per_hundred;
        UNSIGNED4 daily_vaccinations_raw;
        UNSIGNED4 daily_vaccinations;
        DECIMAL daily_vaccinations_per_million;
        DECIMAL share_doses_used;
    END;


    EXPORT ds := DATASET(filePath, layout, flat);


END;