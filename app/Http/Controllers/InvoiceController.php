<?php
namespace App\Http\Controllers;

use App\Http\Requests\StoreInvoiceRequest;
use App\Models\Invoice;
use App\Events\InvoiceCreated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Barryvdh\DomPDF\Facade\Pdf;

class InvoiceController extends Controller
{
    public function dashboard()
    {
         $invoices = Invoice::latest()->paginate(10);
        return view('welcome', compact('invoices'));
    }
    public function index()
    {
        $invoices = Invoice::latest()->paginate(10);
        return view('invoice.index', compact('invoices'));

    }

    public function create()
    {
        return view('invoice.create');
    }

    public function store(StoreInvoiceRequest $request)
    {
        $calc = App::make('InvoiceCalculator');
        $data = $request->validated();
        $calculated = $calc->calculate($data['quantity'], $data['price_per_item'], $data['tax_percentage']);

        $invoice = Invoice::create(array_merge($data, [
            'subtotal' => $calculated['subtotal'],
            'tax_amount' => $calculated['taxAmount'],
            'total' => $calculated['total'],
        ]));

        event(new InvoiceCreated($invoice));
        return redirect('/invoices')->with('success', 'Invoice submitted!');
    }

    public function edit(Invoice $invoice)
    {
        return view('invoice.edit', compact('invoice'));
    }

    public function update(StoreInvoiceRequest $request, Invoice $invoice)
    {
        $calc = App::make('InvoiceCalculator');
        $data = $request->validated();
        $calculated = $calc->calculate($data['quantity'], $data['price_per_item'], $data['tax_percentage']);

        $invoice->update(array_merge($data, [
            'subtotal' => $calculated['subtotal'],
            'tax_amount' => $calculated['taxAmount'],
            'total' => $calculated['total'],
        ]));

        return redirect('/invoices')->with('success', 'Invoice updated!');
    }

    public function destroy(Invoice $invoice)
    {
        $invoice->delete();
        return redirect('/invoices')->with('success', 'Invoice deleted.');
    }

    
    public function download(Invoice $invoice)
    {
        $pdf = Pdf::loadView('invoice.pdf', compact('invoice'));
        return $pdf->download("invoice_{$invoice->id}.pdf");
    }
}
