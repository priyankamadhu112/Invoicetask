@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary"><i class="bi bi-journal-text me-2"></i> All Invoices</h2>
        <a href="{{ route('invoices.create') }}" class="btn btn-outline-primary">
            <i class="bi bi-plus-circle"></i> New Invoice
        </a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-white text-white">
                    <tr>
                        <th>S.No.</th>
                        <th>Client</th>
                        <th>Email</th>
                        <th>Total</th>
                        <th>Date</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($invoices as $key => $invoice)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ $invoice->client_name }}</td>
                            <td>{{ $invoice->email }}</td>
                            <td>${{ number_format($invoice->total, 2) }}</td>
                            <td>{{ $invoice->created_at->format('d M Y') }}</td>
                            <td class="text-end">
                                <a href="{{ route('invoices.download', $invoice->id) }}" class="btn btn-sm btn-outline-info me-1" title="Download Invoice">
                                    <i class="bi bi-download"></i>
                                </a>
                                <a href="{{ route('invoices.edit', $invoice->id) }}" class="btn btn-sm btn-outline-warning">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <form action="{{ route('invoices.destroy', $invoice->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this invoice?');">
                                    @csrf @method('DELETE')
                                    <button class="btn btn-sm btn-outline-danger">
                                        <i class="bi bi-trash3"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @empty
                    @endforelse
                </tbody>
            </table>

        </div>
    </div>

    <div class="mt-3">
        {{ $invoices->links() }}
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script>
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'))
    tooltipTriggerList.map(el => new bootstrap.Tooltip(el))
</script>
<script>
$(document).ready(function () {
    $('table.table').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "lengthChange": true,
        "pageLength": 10,
        "language": {
            "emptyTable": "No invoices found."
        }
    });

});
</script>
@endsection
