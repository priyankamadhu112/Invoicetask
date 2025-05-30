@extends('layouts.app')

@section('content')
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary fw-bold">
            <i class="bi bi-journal-text me-2"></i>Invoices Dashboard
        </h2>
        <a href="{{ route('invoices.create') }}" class="btn btn-primary d-flex align-items-center gap-1">
            <i class="bi bi-plus-circle"></i> New Invoice
        </a>
    </div>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if($invoices->count() > 0)
    <div class="row g-4">
        @foreach($invoices as $invoice)
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm rounded-4 border-0 h-100">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-primary">{{ $invoice->client_name }}</h5>
                        <p class="card-text mb-1"><strong>Email:</strong> {{ $invoice->email }}</p>
                        <p class="card-text mb-1"><strong>Total:</strong> ${{ number_format($invoice->total, 2) }}</p>
                        <p class="card-text text-muted mb-3"><small>Created: {{ $invoice->created_at->format('d M Y') }}</small></p>
                        
                        <div class="mt-auto d-flex justify-content-between">
                            <a href="{{ route('invoices.edit', $invoice->id) }}" class="btn btn-sm btn-outline-warning" title="Edit">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                            <form action="{{ route('invoices.destroy', $invoice->id) }}" method="POST" onsubmit="return confirm('Delete this invoice?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete">
                                    <i class="bi bi-trash3"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <div class="mt-4 d-flex justify-content-center">
        {{ $invoices->links() }}
    </div>
    @else
        <div class="text-center py-5 fst-italic text-muted">
            <i class="bi bi-inbox fs-1"></i>
            <p class="mt-3">No invoices found.</p>
        </div>
    @endif
</div>
@endsection
