@AbapCatalog.sqlViewName: 'ZX_VW_SOITEM2002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales order items'

@OData.publish:true


define view ZXC_SOITEMS_2002 as select from sepm_isoi as SOItems {
 
    key SOItems.salesorderitemuuid, 
    
    @UI: {lineItem: {position: 10, importance: #HIGH}}
    SOItems.salesorderuuid as SalesOrderID, 
    
     @UI: {lineItem: {position: 20, importance: #HIGH}}
    SOItems.salesorderitem as ItemPosition, 
    
     @UI: {lineItem: {position: 30, importance: #HIGH, label: 'Product ID'}}
    SOItems.productuuid as ProductID, 
    
    SOItems.shorttextgroupuuid as NoteID, 
    
    SOItems.transactioncurrency as CurrencyCode, 
    
     @UI: {lineItem: {position: 40, importance: #HIGH}}
    SOItems.grossamountintransaccurrency as GrossAmount, 
    
     @UI: {lineItem: {position: 50, importance: #HIGH}}
    SOItems.netamountintransactioncurrency as NetAmount, 
    
     @UI: {lineItem: {position: 60, importance: #HIGH}}
    SOItems.taxamountintransactioncurrency as TaxAmount, 
    
    SOItems.productavailabilitystatus as StatusAvailability, 
    SOItems.opportunityitem as OpportunityItem
    
}
