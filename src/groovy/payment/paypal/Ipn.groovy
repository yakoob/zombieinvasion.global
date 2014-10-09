package payment.paypal

import groovy.transform.ToString
import groovy.transform.TupleConstructor

@ToString(includeNames = true)
@TupleConstructor
class Ipn {

    String last_name
    String address_name
    String txn_type
    String receiver_email
    String address_city
    String residence_country
    String payment_gross
    String payment_date
    String address_zip
    String payment_status
    String address_street
    String first_name
    String payer_email
    String payer_id
    String verify_sign
    String payment_type
    String business
    String address_country_code
    String mc_fee
    String address_status
    String quantity
    String notify_version
    String mc_currency
    String custom
    String address_state
    String payment_fee
    String payer_status
    String shipping
    String item_name
    String tax
    String charset
    String item_number
    String invoice
    String mc_gross
    String txn_id
    String receiver_id
    String address_country

}
