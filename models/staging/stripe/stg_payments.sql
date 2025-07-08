select
    ID,
    orderid ORDER_ID,
    PAYMENTMETHOD,
    STATUS,
    (AMOUNT/100) as amount, --converting the amount in cents to dollers
    CREATED as created_At
from
    {{source('stripe','PAYMENT')}}