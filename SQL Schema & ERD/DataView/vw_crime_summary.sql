-- View: public.vw_crime_summary

-- DROP VIEW public.vw_crime_summary;

CREATE OR REPLACE VIEW public.vw_crime_summary
 AS
 SELECT a.county_id,
    a.murder_2018,
    a.rape_2018,
    a.robbery_2018,
    a.assualt_2018,
    a.burglary_2018,
    a.larceny_2018,
    a.auto_theft_2018,
    b.murder_2019,
    b.rape_2019,
    b.robbery_2019,
    b.assualt_2019,
    b.burglary_2019,
    b.larceny_2019,
    b.auto_theft_2019,
    c.murder_2020,
    c.rape_2020,
    c.robbery_2020,
    c.assualt_2020,
    c.burglary_2020,
    c.larceny_2020,
    c.auto_theft_2020
   FROM ( SELECT crime_data.county_id,
            sum(crime_data.murder_count) AS murder_2018,
            sum(crime_data.rape_count) AS rape_2018,
            sum(crime_data.robbery_count) AS robbery_2018,
            sum(crime_data.assualt_count) AS assualt_2018,
            sum(crime_data.burglary_count) AS burglary_2018,
            sum(crime_data.larceny_count) AS larceny_2018,
            sum(crime_data.auto_theft_count) AS auto_theft_2018
           FROM crime_data
          GROUP BY crime_data.county_id, crime_data.year
         HAVING crime_data.year = 2018) a,
    ( SELECT crime_data.county_id,
            sum(crime_data.murder_count) AS murder_2019,
            sum(crime_data.rape_count) AS rape_2019,
            sum(crime_data.robbery_count) AS robbery_2019,
            sum(crime_data.assualt_count) AS assualt_2019,
            sum(crime_data.burglary_count) AS burglary_2019,
            sum(crime_data.larceny_count) AS larceny_2019,
            sum(crime_data.auto_theft_count) AS auto_theft_2019
           FROM crime_data
          GROUP BY crime_data.county_id, crime_data.year
         HAVING crime_data.year = 2019) b,
    ( SELECT crime_data.county_id,
            sum(crime_data.murder_count) AS murder_2020,
            sum(crime_data.rape_count) AS rape_2020,
            sum(crime_data.robbery_count) AS robbery_2020,
            sum(crime_data.assualt_count) AS assualt_2020,
            sum(crime_data.burglary_count) AS burglary_2020,
            sum(crime_data.larceny_count) AS larceny_2020,
            sum(crime_data.auto_theft_count) AS auto_theft_2020
           FROM crime_data
          GROUP BY crime_data.county_id, crime_data.year
         HAVING crime_data.year = 2020) c
  WHERE a.county_id = b.county_id AND b.county_id = c.county_id
  ORDER BY a.county_id;

ALTER TABLE public.vw_crime_summary
    OWNER TO postgres;

