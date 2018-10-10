@AbapCatalog.sqlViewName: 'ZX_VW_PRODS_2002'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Products'
@VDM.viewType: #CONSUMPTION

@OData.publish:true


define view ZXC_PRODUCTS_2002
  as select
    *
  from ZXC_PROD_2002 (p_category: 'Notebooks')
