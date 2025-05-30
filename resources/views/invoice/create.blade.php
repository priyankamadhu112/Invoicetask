@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary"><i class="bi bi-journal-text me-2"></i> Create Invoice</h2>
    </div>

        <div class="card card-body">
            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <form method="POST" action="{{route('invoices.store')}}" id="invoice-form">
                @csrf
                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label for="client_name" class="form-label">Client Name</label>
                        <input type="text" name="client_name" id="client_name" class="form-control" >
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Client Email</label>
                        <input type="email" name="email" id="email" class="form-control" >
                    </div>
                </div>

                <div class="mb-3">
                    <label for="item_description" class="form-label">Item Description</label>
                    <textarea name="item_description" id="item_description" class="form-control" rows="3" ></textarea>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-4">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" name="quantity" id="quantity" class="form-control"  min="1">
                    </div>
                    <div class="col-md-4">
                        <label for="price_per_item" class="form-label">Price per Item ($)</label>
                        <input type="number" name="price_per_item" id="price_per_item" class="form-control" step="0.01" >
                    </div>
                    <div class="col-md-4">
                        <label for="tax_percentage" class="form-label">Tax (%)</label>
                        <input type="number" name="tax_percentage" id="tax_percentage" class="form-control" step="0.01" >
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
                    <i class="bi bi-send-fill me-1"></i> Submit Invoice
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

    // Show error message after the input
    function showError(field, message) {
        // Remove existing message first
        $(field).next('.custom-error-msg').remove();
        // Insert new message
        $('<div class="text-danger small custom-error-msg mt-1"></div>').text(message).insertAfter(field);
    }

    // Remove error message
    function removeError(field) {
        $(field).next('.custom-error-msg').remove();
    }

    // Validate a single field by id and value, return error message or empty string
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
        return ''; // no error
    }

    $(document).ready(function () {
        // Recalculate invoice when inputs change
        $('#quantity, #price_per_item, #tax_percentage').on('input', calculateInvoice);

        // Validate inputs on input event (live validation)
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

        // Final validation on form submit
        $('#invoice-form').on('submit', function (e) {
            let isValid = true;

            // Clear previous errors
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
                // Optionally, scroll to first error
                $('html, body').animate({
                    scrollTop: $('.is-invalid').first().offset().top - 100
                }, 300);
            }
        });
    });
</script>



@endsection
