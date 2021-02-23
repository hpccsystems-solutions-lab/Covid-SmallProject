IMPORT layouts.raw.vaccine as raw;//raw file definition
IMPORT layouts.public.vaccine as public;//clean file definition
IMPORT STD;

/* 
   Convert the raw data from a raw.layout to public.layout 
   If you are converting every record in the dataset to another record in the new dataset, you
   will use the PROJECT function in ECL   
*/


cleanDS := PROJECT(raw.ds, TRANSFORM(public.layout,
                                  SELF.Date := Std.Date.FromStringToDate(LEFT.Date, '%Y-%m-%d'),
                                  SELF.location:= IF( LEFT.location = 'New York State', 'NEW YORK',Std.Str.ToUpperCase(LEFT.location)),
                                  SELF := LEFT));

OUTPUT(cleanDS,,NAMED('data_cleaned'));//Output sample clean to workunit output for debugging purposes

/* While this looks great, we still have a problem with. If you
   look at the data you can observe that we are getting daily staus of the
   vaccine rollout in many of the columns. For example, total_vaccinations is 
   total count of vaccinations that have been given until that date. 
   However, you can also see that for several days, the values are zero or blank. 
   This would be an incorrect status to report for that day. To overcome this issue,
   we will carry forward the non zero data from the previous time it was reported. 
   ECL has the perfect pattern for this and it is called as ITERATE */


fixNoDataDS := ITERATE(SORT(cleanDS, location, date), //Make sure it is sorted so that we have the correct adjecent record
                  TRANSFORM(public.layout, 
                            SELF.total_vaccinations := IF (RIGHT.location=LEFT.location and RIGHT.total_vaccinations = 0, LEFT.total_vaccinations, RIGHT.total_vaccinations),
                            SELF.total_distributed := IF (RIGHT.location=LEFT.location and RIGHT.total_distributed = 0, LEFT.total_distributed, RIGHT.total_distributed),
                            SELF.people_fully_vaccinated := IF (RIGHT.location=LEFT.location and RIGHT.people_fully_vaccinated  = 0, LEFT.people_fully_vaccinated , RIGHT.people_fully_vaccinated ),
                            SELF := RIGHT));//This SELF=RIGHT is super convinient. It copies every element as it is on the RIGHT other than the above  

OUTPUT(fixNoDataDS,,NAMED('data_nodata_fix'));//Output no data fixed dataset to workunit output for debugging purposes                            

//Create the cleaned file
//NOTE: If this job is not run and the dataset is accessed via layouts.public.owid.ds, you will get an error that file does not exist
OUTPUT(fixNoDataDS,,public.filePath,
   thor,compressed,overwrite,expire(10),named('vaccine_clean'));


