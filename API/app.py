import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify


#################################################
# Database Setup
#################################################
engine = create_engine("postgresql://postgres:@localhost/project3")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(autoload_with=engine)

# Save reference to the table
county = Base.classes.county
vw_geo_crime_census = Base.classes.vw_geo_crime_census

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/api/v1.0/getCensusData<br/>"
        f"/api/v1.0/getCrimeDataByCounty"
    )

app.route("/api/v1.0/getCensusData")
def countyList():
    # Create our session (link) from Python to the DB
    session = Session(engine)
    counties = []
    """Return a list of county's census data"""
    # Query all counties
    results = session.query(county.county_name).all()
    # Convert list of tuples into normal list
    for c in results:
        counties.append({"county_id": c.county_id, "county_name": c.county_name})
    counties = list(results)
    session.close()

    return jsonify(counties)

def geo_crime_census_dataview():
    # Create our session (link) from Python to the DB
    session = Session(engine)
    counties = []
    """Return a list of county's census data"""
    # Query all counties
    results = session.query(vw_geo_crime_census).all()
    # Convert list of tuples into normal list
    for c in results:
        counties.append({"county_id": c.county_id, 
                         "murder_2018": c.murder_2018, 
                         "murder_2019": c.murder_2019, 
                         "murder_2020": c.murder_2020, 
                         "rape_2018": c.rape_2018,
                         "rape_2019": c.rape_2019,
                         "rape_2020": c.rape_2020,
                         "robbery_2018": c.robbery_2018,
                         "robbery_2019": c.robbery_2019,
                         "robbery_2020": c.robbery_2020,                         
                         "assualt_2018": c.assualt_2018,
                         "assualt_2019": c.assualt_2019,
                         "assualt_2020": c.assualt_2020,
                         "burglary_2018": c.burglary_2018,
                         "burglary_2019": c.burglary_2019,
                         "burglary_2020": c.burglary_2020,
                         "larceny_2018": c.larceny_2018,
                         "larceny_2019": c.larceny_2019,
                         "larceny_2020": c.larceny_2020,
                         "auto_theft_2018" : c.auto_theft_2018,
                         "auto_theft_2019" : c.auto_theft_2019,
                         "auto_theft_2020" : c.auto_theft_2020,
                         "COUNTY_NAME":c.COUNTY_NAME,
                         "POPULATION_25+": "c.POPULATION_25+",
    b."MEDIAN_HOUSEHOLD_INCOME",
    b."HIGH_SCHOOL",
    b."BACHELOR",
    b."MASTERS",
    b."DOCTORATE",
    b."PROFESSIONAL",
    b."HIGH_SCHOOL_PERCENTAGE",
    b."BACHELOR_PERCENTAGE",
    b."MASTERS_PERCENTAGE",
    b."DOCTORATE_PERCENTAGE",
    b."PROFESSIONAL_PERCENTAGE",
    b."TOTAL_BACHELOR+_PERCENTAGE",
    c."OBJECTID",
    c."COUNTY",
    c."COUNTY_ID",
    c."COUNTY_LABEL",
    c."CO",
    c."GNIS_NAME",
    c."GNIS",
    c."FIPSSTCO",
    c."FIPSCO",
    c."ACRES",
    c."SQ_MILES",
    c."POP2020",
    c."POP2010",
    c."POP2000",
    c."POP1990",
    c."POP1980",
    c."POPDEN2020",
    c."POPDEN2010",
    c."POPDEN2000",
    c."POPDEN1990",
    c."POPDEN1980",
    c."REGION",
    c."Shape_Length",
    c."Shape_Area"
   F
                         })    
    counties = list(results)
    session.close()

    return jsonify(counties)
if __name__ == '__main__':
    app.run(debug=True)
