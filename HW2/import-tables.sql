-- import file
PRAGMA foreign_keys=off;
.mode csv
.import ./desktop/CSE414/flight-dataset/flights-small.csv Flights
.import ./desktop/CSE414/flight-dataset/carriers.csv Carriers
.import ./desktop/CSE414/flight-dataset/months.csv Months
.import ./desktop/CSE414/flight-dataset/weekdays.csv Weekdays