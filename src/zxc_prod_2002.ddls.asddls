@AbapCatalog.sqlViewName: 'ZX_VW_PROD_2002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Products'
@VDM.viewType: #CONSUMPTION

define view ZXC_PROD_2002
  with parameters
    p_category :string40
  as select from sepm_iproduct as Products
{

  key Products.productuuid,
      Products.product              as ProductID,
      Products.creationdatetime     as CreationDateTime,
      Products.producttype          as ProductType,
      Products.productcategory      as ProductCategory,
      Products.price                as Price,
      Products.productvalueaddedtax as Tax

}
where
  Products.productcategory = $parameters.p_category
