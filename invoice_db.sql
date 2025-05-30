-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2025 at 12:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '6f99c6ea-eb3c-4926-8da7-16cbb4d7d367', 'database', 'default', '{\"uuid\":\"6f99c6ea-eb3c-4926-8da7-16cbb4d7d367\",\"displayName\":\"App\\\\Listeners\\\\SendInvoiceEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:30:\\\"App\\\\Listeners\\\\SendInvoiceEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\InvoiceCreated\\\":1:{s:7:\\\"invoice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Invoice\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"priyanka.zigainfotech@gmail.com\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:226\nStack trace:\n#0 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(161): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(118): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(210): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(573): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(357): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#13 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\InvoiceMail))\n#14 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\InvoiceMail))\n#15 C:\\xampp\\htdocs\\Invoice-Task\\app\\Listeners\\SendInvoiceEmail.php(29): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\InvoiceMail))\n#16 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\CallQueuedListener.php(114): App\\Listeners\\SendInvoiceEmail->handle(Object(App\\Events\\InvoiceCreated))\n#17 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#18 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#19 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#20 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#21 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#22 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#23 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#24 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#25 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#27 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#28 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#29 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#31 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#32 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#33 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(176): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#37 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#38 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#39 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#40 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#41 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#42 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#43 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(1096): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(175): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Invoice-Task\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 {main}', '2025-05-29 11:35:13'),
(2, '9e18fd15-1f61-4da5-8283-8265e8941944', 'database', 'default', '{\"uuid\":\"9e18fd15-1f61-4da5-8283-8265e8941944\",\"displayName\":\"App\\\\Listeners\\\\SendInvoiceEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:30:\\\"App\\\\Listeners\\\\SendInvoiceEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\InvoiceCreated\\\":1:{s:7:\\\"invoice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Invoice\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"priyanka.zigainfotech@gmail.com\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:226\nStack trace:\n#0 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(161): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(118): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(210): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(573): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(357): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#13 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\InvoiceMail))\n#14 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\InvoiceMail))\n#15 C:\\xampp\\htdocs\\Invoice-Task\\app\\Listeners\\SendInvoiceEmail.php(29): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\InvoiceMail))\n#16 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\CallQueuedListener.php(114): App\\Listeners\\SendInvoiceEmail->handle(Object(App\\Events\\InvoiceCreated))\n#17 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#18 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#19 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#20 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#21 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#22 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#23 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#24 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#25 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#27 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#28 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#29 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#31 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#32 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#33 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(176): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#37 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#38 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#39 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#40 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#41 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#42 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#43 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(1096): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\symfony\\console\\Application.php(175): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Invoice-Task\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Invoice-Task\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 {main}', '2025-05-29 12:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_item` decimal(10,2) NOT NULL,
  `tax_percentage` decimal(5,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `client_name`, `email`, `item_description`, `quantity`, `price_per_item`, `tax_percentage`, `subtotal`, `tax_amount`, `total`, `created_at`, `updated_at`) VALUES
(11, 'Madhu', 'madhupriyanka429@gmail.com', 'testing', 10, 200.00, 10.00, 2000.00, 200.00, 2200.00, '2025-05-30 04:53:15', '2025-05-30 04:55:38'),
(12, 'Priyanka M', 'priyankamadhu112@gmail.com', 'Testing purpose', 10, 250.00, 10.00, 2500.00, 250.00, 2750.00, '2025-05-30 04:55:20', '2025-05-30 04:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_28_171740_create_invoices_table', 1),
(6, '2025_05_28_172449_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
