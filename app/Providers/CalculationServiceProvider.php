<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class CalculationServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton('InvoiceCalculator', \App\Services\InvoiceCalculator::class);

    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
