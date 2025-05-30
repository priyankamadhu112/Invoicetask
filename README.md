# 🧾 Laravel Invoice Generator

This is a Laravel-based Invoice Generator that demonstrates:

- Form validation using Form Requests
- Mathematical logic via a custom service registered through a Service Provider
- Event dispatching (`InvoiceCreated`)
- Email notification queued with Laravel Queue system (using database driver)

---

## 🚀 Features

- Invoice form with fields:
  - Client Name
  - Email
  - Item Description
  - Quantity
  - Price per Item
  - Tax Percentage
- Form validation using Laravel’s `FormRequest`
- Subtotal, Tax, and Total calculated using a custom `InvoiceCalculator` service
- Email is sent to the client asynchronously when an invoice is created
- Clean structure using:
  - Service Providers
  - Events & Listeners
  - Queues (Database Driver)

---

## ⚙️ Requirements

- PHP >= 8.1
- Composer
- Laravel 10+
- MySQL

## Database name
 - invoice
 
---

## 🛠️ Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/priyankamadhu112/Invoicetask.git
cd Invoicetask
