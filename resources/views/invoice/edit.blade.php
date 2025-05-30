@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary"><i class="bi bi-pencil-square me-2"></i> Edit Invoice</h2>
    </div>

    <div class="card card-body p-5">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <form method="POST" action="{{ route('invoices.update', $invoice->id) }}" id="invoice-form">
            @csrf
            @method('PUT')
            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label for="client_name" class="form-label">Client Name</label>
                    <input type="text" name="client_name" id="client_name" class="form-control" value="{{ old('client_name', $invoice->client_name) }}">
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Client Email</label>
                    <input type="email" name="email" id="email" class="form-control" value="{{ old('email', $invoice->email) }}">
                </div>
            </div>

            <div class="mb-3">
                <label for="item_description" class="form-label">Item Description</label>
                <textarea name="item_description" id="item_description" class="form-control" rows="3">{{ old('item_description', $invoice->item_description) }}</textarea>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-4">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" min="1" value="{{ old('quantity', $invoice->quantity) }}">
                </div>
                <div class="col-md-4">
                    <label for="price_per_item" class="form-label">Price per Item ($)</label>
                    <input type="number" name="price_per_item" id="price_per_item" class="form-control" step="0.01" value="{{ old('price_per_item', $invoice->price_per_item) }}">
                </div>
                <div class="col-md-4">
                    <label for="tax_percentage" class="form-label">Tax (%)</label>
                    <input type="number" name="tax_percentage" id="tax_percentage" class="form-control" step="0.01" value="{{ old('tax_percentage', $invoice->tax_percentage) }}">
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label class="form-label">Subtotal</label>
                    <input type="text" id="subtotal" class="form-control bg-light" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Tax Amount</label>
                    <input type="text" id="tax_amount" class="form-control bg-light" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold">Total</label>
                    <input type="text" id="total" class="form-control bg-light text-success fw-bold" readonly>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">
                <i class="bi bi-save-fill me-1"></i> Update Invoice
            </button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    function calculateInvoice() {
        const quantity = parseFloat($('#quantity').val()) || 0;
        const price = parseFloat($('#price_per_item').val()) || 0;
        const tax = parseFloat($('#tax_percentage').val()) || 0;

        const subtotal = quantity * price;
        const taxAmount = subtotal * (tax / 100);
        const total = subtotal + taxAmount;

        $('#subtotal').val(subtotal.toFixed(2));
        $('#tax_amount').val(taxAmount.toFixed(2));
        $('#total').val(total.toFixed(2));
    }

    function showError(field, message) {
        $(field).next('.custom-error-msg').remove();
        $('<div class="text-danger small custom-error-msg mt-1"></div>').text(message).insertAfter(field);
    }

    function removeError(field) {
        $(field).next('.custom-error-msg').remove();
    }

    function validateField(id, value) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        switch (id) {
            case 'client_name':
                if (!/^[A-Za-z\s]+$/.test(value.trim())) return 'Only letters and spaces allowed.';
                break;
            case 'email':
                if (!emailRegex.test(value.trim())) return 'Invalid email address.';
                break;
            case 'item_description':
                if (value.trim() === '') return 'Description cannot be empty.';
                break;
            case 'quantity':
                if (isNaN(value) || parseFloat(value) < 1) return 'Quantity must be at least 1.';
                break;
            case 'price_per_item':
                if (isNaN(value) || parseFloat(value) < 0) return 'Price must be zero or positive.';
                break;
            case 'tax_percentage':
                if (isNaN(value) || parseFloat(value) < 0) return 'Tax must be zero or positive.';
                break;
        }
        return '';
    }

    $(document).ready(function () {
        calculateInvoice(); // Initial calculation

        $('#quantity, #price_per_item, #tax_percentage').on('input', calculateInvoice);

        $('#invoice-form input, #invoice-form textarea').on('input', function () {
            const id = this.id;
            const val = $(this).val();
            const errorMsg = validateField(id, val);

            if (errorMsg) {
                $(this).addClass('is-invalid');
                showError(this, errorMsg);
            } else {
                $(this).removeClass('is-invalid');
                removeError(this);
            }
        });

        $('#invoice-form').on('submit', function (e) {
            let isValid = true;
            $('.form-control').removeClass('is-invalid');
            $('.custom-error-msg').remove();

            $('#invoice-form input, #invoice-form textarea').each(function () {
                const id = this.id;
                const val = $(this).val();
                const errorMsg = validateField(id, val);

                if (errorMsg) {
                    $(this).addClass('is-invalid');
                    showError(this, errorMsg);
                    isValid = false;
                }
            });

            if (!isValid) {
                e.preventDefault();
                $('html, body').animate({
                    scrollTop: $('.is-invalid').first().offset().top - 100
                }, 300);
            }
        });
    });
</script>
@endsection
