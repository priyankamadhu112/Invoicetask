@component('mail::message')
# 🧾 Invoice Summary

Hello **{{ $invoice->client_name }}**,

Thank you for your business. Please find your invoice details below:

---

## 📄 Invoice Details

**Item Description:**  
{{ $invoice->item_description }}

---

## 📊 Billing Summary

| Description       | Amount         |
|-------------------|----------------|
| Quantity          | {{ $invoice->quantity }} |
| Price per Item    | ${{ number_format($invoice->price_per_item, 2) }} |
| **Subtotal**      | **${{ number_format($invoice->subtotal, 2) }}** |
| Tax Amount        | ${{ number_format($invoice->tax_amount, 2) }} |
| **Total Due**     | **$ {{ number_format($invoice->total, 2) }}** |

---

If you have any questions regarding this invoice, feel free to reply to this email.

Thanks for choosing **{{ config('app.name') }}**!

Best regards,  
**{{ config('app.name') }} Team**
@endcomponent
