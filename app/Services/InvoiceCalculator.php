<?php
namespace App\Services;

class InvoiceCalculator
{
    public function calculate($quantity, $pricePerItem, $taxPercentage)
    {
        $subtotal = $quantity * $pricePerItem;
        $taxAmount = $subtotal * ($taxPercentage / 100);
        $total = $subtotal + $taxAmount;

        return compact('subtotal', 'taxAmount', 'total');
    }
}
