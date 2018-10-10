@AbapCatalog.sqlViewName: 'Z2002_FLICHART'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'

@UI.chart: [{
    qualifier: 'OccupiedSeats',
    chartType: #COLUMN,
    dimensions:  [ 'FlightCode' ],
    measures:  [ 'MaximumCapacity', 'EconomyOccupiedSeats', 'BusinessOccupiedSeats', 'FirstOccupiedSeats' ]
}]

define view Z2002_DEMO_FLIGHT_CHART
  as select from sflight
{
  key concat(carrid, connid) as FlightCode,

  key fldate                 as FlightDate,

      seatsmax               as MaximumCapacity,

      seatsocc               as EconomyOccupiedSeats,

      seatsocc_b             as BusinessOccupiedSeats,

      seatsocc_f             as FirstOccupiedSeats
}
