IMPORT layouts.raw.population as raw;
IMPORT layouts.public.population as public;
IMPORT Std;

//Filter so that we only have state population
statesOnlyDS := raw.ds (state <> '0');

//now transform to clean dataset ROLLUP state level population for all groups
//We just need location (aka state) and total population. Remeber the raw data is much more 
//granular and you need to summarize it at the state level. Hence, you use the ROLLUP pattern

statesGroupedDS := GROUP(SORT(statesOnlyDS, name), name);// GROUP the data by name

statesDS := ROLLUP(statesGroupedDS, GROUP, 
                   TRANSFORM(public.layout, 
                             SELF.population := SUM(ROWS(LEFT), (REAL)POPEST2018_CIV) ,
                             SELF.location := Std.Str.ToUpperCase(LEFT.name)));

//NOTE: You could also accomplish this with a TABLE pattern but ROLLOUP is more approproate if you are applying 
//complex transformations


OUTPUT(statesDS,,public.filePath,
   thor,compressed,overwrite,expire(10),named('state_population'));

