@AbapCatalog.sqlViewName: 'Z2002_FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'

@UI.headerInfo: {
    title.value: 'FlightCode',
    description.value: 'PlaneType',
    typeName: 'Flight',
    typeNamePlural: 'Flights'
}

@OData.publish: true

define view Z2002_DEMO_FLIGHT
  as select from sflight
  association [0..*] to Z2002_DEMO_FLIGHT_CHART as _Chart on  $projection.FlightCode = _Chart.FlightCode
                                                     and $projection.FlightDate = _Chart.FlightDate
{
      @EndUserText.label: 'Flight Code'
      @UI: {
          lineItem.position: 10,
          fieldGroup: {
            qualifier: 'FlightDetails',
            position: 10
          }
      }
  key concat(carrid, connid) as FlightCode,

      @UI: {
          selectionField.position: 10,
          lineItem.position: 20,
          fieldGroup: {
            qualifier: 'FlightDetails',
            position: 20
          }
      }
  key fldate                 as FlightDate,

      @UI.lineItem.position: 30
      @Semantics.amount.currencyCode: 'Currency'
      price                  as Price,

      @Semantics.currencyCode: true
      currency               as Currency,
      
      planetype              as PlaneType,
      
      _Chart
}
