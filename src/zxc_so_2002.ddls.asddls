@AbapCatalog.sqlViewName: 'ZX_VW_SO_2002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Orders'
@VDM.viewType: #CONSUMPTION


@OData.publish: true


@UI.headerInfo:{
    typeName: 'HAND Sales Order',
    typeNamePlural: 'HAND Sales Orders',
    imageUrl: {value: 'PictureUrl'},
    title: {value: 'CompanyName'},
    description: {value: 'Description'}
}

define view ZXC_SO_2002 as select from sepm_iso as SO 
association [1..1] to sepm_ibupa as _BP on $projection.CustomerID = _BP.businesspartneruuid
association [1..*] to ZXC_SOITEMS_2002 as _SOITEMS on $projection.salesorderuuid = _SOITEMS.SalesOrderID

{
    
    key SO.salesorderuuid, 
    
    @UI: {lineItem: {position: 10, importance: #HIGH}, identification: {position: 10, importance: #HIGH}}
    SO.salesorder as SalesOrderID,   
    
    SO.creationdatetime as DateCreated,   
    SO.shorttextgroupuuid as NoteID, 
    SO.customeruuid as CustomerID, 
    
    @UI: {lineItem: {position: 20, importance: #HIGH, label: 'Business Partner'}, selectionField.position: 10, identification: {position: 20, importance: #HIGH}}
    _BP.businesspartner as BusinessPartner,
    
    @UI: {lineItem: {position: 30, importance: #HIGH, label: 'Company Name'}, selectionField.position: 20, identification: {position: 30, importance: #HIGH}}
    _BP.companyname as CompanyName,
    
    SO.transactioncurrency as TransactionCurrency, 
    
    @UI: {lineItem: {position: 50, importance: #HIGH, label: 'Gross Amount'}, dataPoint: {title: 'Gross Amount'}}
    SO.grossamountintransaccurrency as GrossAmount, 
    
    @UI: {lineItem: {position: 40, importance: #HIGH}, dataPoint: {title: 'Net Amount'}}
    SO.netamountintransactioncurrency as NetAmount, 
    
    @UI: {dataPoint: {title: 'Tax Amount'}}
    SO.taxamountintransactioncurrency as TaxAmount,
    
        '/images/hand_logo2.png' as PictureUrl,  
        concat('SalesOrder Details for: ', SO.salesorder) as Description,
        
    _SOITEMS
 
}
