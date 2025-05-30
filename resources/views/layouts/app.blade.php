<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">

</head>
<body>

    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="text-center mb-4 mt-3">
            <h4 class="text-white">📄 InvoiceApp</h4>
        </div>
        <a href="/" class="{{ Request::is('/') ? 'active' : '' }}">
            <i class="bi bi-house-door me-2"></i> Dashboard
        </a>
        <a href="{{ route('invoices.index') }}" class="{{ Request::is('invoices') ? 'active' : '' }}">
            <i class="bi bi-receipt me-2"></i> Invoice List
        </a>
        <a href="{{ route('invoices.create') }}" class="{{ Request::is('invoices/create') ? 'active' : '' }}">
            <i class="bi bi-plus-square me-2"></i> Create Invoice
        </a>
      
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Invoice Management System</h5>
            <div>
                <span class="me-3">Welcome, {{ Auth::user()->name ?? 'Guest' }}</span>
                @auth
                    <a href="{{ route('logout') }}" class="btn btn-sm btn-outline-danger"
                       onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        Logout
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                @endauth
            </div>
        </header>

        <!-- Content -->
        <main class="content-wrapper">
            @yield('content')
        </main>

        <!-- Footer -->
        <footer class="footer">
            &copy; {{ date('Y') }} InvoiceApp. All rights reserved.
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
