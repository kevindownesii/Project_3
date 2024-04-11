import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import pandas as pd
from flask_cors import CORS

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
#vw_geo_crime_census = Base.classes.vw_geo_crime_census

#################################################
# Flask Setup
#################################################
app = Flask(__name__)
# enable CORS for all routes
CORS(app)

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

@app.route("/api/v1.0/getCounties")
def countyList():
    # Create our session (link) from Python to the DB
    session = Session(engine)
    counties = []
    """Return a list of county's census data"""
    # Query all counties
    results = session.query(county).all()
    # Convert list of tuples into normal list
    for c in results:
        counties.append({"county_id": c.county_id, "county_name": c.county_name})

    session.close()

    return jsonify(counties)

@app.route("/api/v1.0/getCensusData")
def geo_crime_census_dataview():
    # Create our session (link) from Python to the DB
    #session = Session(engine)
    conn = engine.connect()
    census_df = pd.read_sql("SELECT * FROM vw_geo_crime_census", conn)    
    census_data = census_df.to_json(orient='records')
    print(census_data)
    #census_data = census_df.values.tolist()    
    """Return a list of county's census data"""    
    return census_data

if __name__ == '__main__':
    app.run(debug=True)
