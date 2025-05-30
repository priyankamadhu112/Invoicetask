<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice - {{ $invoice->id }}</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 14px;
            color: #333;
            line-height: 1.6;
        }
        h1, h2, h3 {
            margin: 0 0 10px;
        }
        .header, .footer {
            text-align: center;
            margin-bottom: 30px;
        }
        .invoice-details, .billing-summary {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .invoice-details td, .billing-summary td, .billing-summary th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .billing-summary th {
            background-color: #f2f2f2;
        }
        .total {
            font-weight: bold;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>🧾 Invoice</h1>
        <p><strong>Invoice ID:</strong> {{ $invoice->id }}</p>
        <p><strong>Date:</strong> {{ $invoice->created_at->format('d M Y') }}</p>
    </div>

    <div>
        <h3>Client Information</h3>
        <p><strong>Name:</strong> {{ $invoice->client_name }}</p>
        <p><strong>Email:</strong> {{ $invoice->client_email }}</p>
    </div>

    <table class="invoice-details">
        <tr>
            <td><strong>Item Description</strong></td>
            <td>{{ $invoice->item_description }}</td>
        </tr>
        <tr>
            <td><strong>Quantity</strong></td>
            <td>{{ $invoice->quantity }}</td>
        </tr>
        <tr>
            <td><strong>Price per Item</strong></td>
            <td>${{ number_format($invoice->price_per_item, 2) }}</td>
        </tr>
    </table>

    <table class="billing-summary">
        <tr>
            <th>Description</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>Subtotal</td>
            <td>${{ number_format($invoice->subtotal, 2) }}</td>
        </tr>
        <tr>
            <td>Tax</td>
            <td>${{ number_format($invoice->tax_amount, 2) }}</td>
        </tr>
        <tr class="total">
            <td>Total Due</td>
            <td>${{ number_format($invoice->total, 2) }}</td>
        </tr>
    </table>

    <div class="footer">
        <p>Thank you for your business!</p>
        <p><strong>{{ config('app.name') }}</strong></p>
    </div>

</body>
</html>
