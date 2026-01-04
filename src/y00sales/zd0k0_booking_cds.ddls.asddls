@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking'
@Metadata.allowExtensions: true
define root view entity zd0k0_booking_cds as select from zd0k0_booking259
{
  key travel_id     as Travel_Id,
  key booking_id    as Booking_Id,
      booking_date  as Booking_Date,
      customer_id   as Customer_Id,
      carrier_id    as Carrier_Id,
      connection_id as Connection_Id,
      flight_date   as Flight_Date,
      flight_price  as Flight_Price,
      currency_code as Currency_Code
}
