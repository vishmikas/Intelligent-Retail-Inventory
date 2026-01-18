Software Requirements Specification (SRS)

Project: StockMaster - Intelligent Retail Inventory & POS
Version: 1.0

Date: January 2026

Author: Dilum Samarathunga

1. Introduction
   1.1 Purpose
   The purpose of this document is to define the functional, non-functional, and interface requirements for the StockMaster application. This document serves as a guide for the development phase and a benchmark for the testing phase.

1.2 Project Scope
StockMaster is a desktop-based Java application designed to streamline inventory management and sales processing for retail environments. It replaces manual entry with a centralized database system, ensuring data integrity, real-time stock tracking, and secure financial reporting.

1.3 Definitions, Acronyms, and Abbreviations
POS: Point of Sale

CRUD: Create, Read, Update, Delete

DAO: Data Access Object

SKU: Stock Keeping Unit

VAT: Value Added Tax

2. Overall Description
   2.1 Product Perspective
   StockMaster is a standalone system that communicates with a MySQL database. It follows the MVC (Model-View-Controller) architecture to ensure that the user interface, business logic, and data storage remain decoupled and maintainable.

2.2 User Classes and Characteristics
System Administrator (Admin): Full access to the system, including user management, inventory pricing, and financial analytics.

Cashier: Limited access, primarily focused on the Sales/Billing interface and viewing product availability.

2.3 Operating Environment
OS: Windows 10/11, macOS, or Linux.

Platform: Java Runtime Environment (JRE) 17 or higher.

Database: MySQL Server 8.0+.

3. Functional Requirements
   
3.1 User Authentication Module (SEC)
   FR-SEC-01: The system shall provide a secure login screen.

FR-SEC-02: Passwords must be encrypted using SHA-256 before being stored in the database.

FR-SEC-03: The system shall identify the user role (Admin/Cashier) upon login and redirect to the appropriate dashboard.

3.2 Inventory Management Module (INV)
FR-INV-01: Admin shall be able to add new products with Name, SKU, Category, Cost Price, Selling Price, and Quantity.

FR-INV-02: The system shall allow searching for products by Name or SKU in real-time.

FR-INV-03: The system shall highlight items in "Red" when the stock level falls below a threshold (e.g., 5 units).

3.3 Sales and Billing Module (POS)
FR-POS-01: The system shall allow the user to add items to a virtual cart using a search bar.

FR-POS-02: The system shall automatically calculate Subtotal, Tax (15%), and Grand Total.

FR-POS-03: Upon checkout, the system must reduce the inventory count and generate a PDF Receipt.

3.4 Reporting & Analytics (REP)
FR-REP-01: The Admin shall be able to view a "Daily Sales Report" summarizing total revenue.

FR-REP-02: The system shall provide a visual Bar Chart showing the "Top 5 Selling Products."

4. Non-Functional Requirements
   
4.1 Performance
   The system shall load the main dashboard in less than 2 seconds.

Database search queries shall return results in under 500ms for up to 5,000 records.

4.2 Security
Users shall be automatically logged out after 30 minutes of inactivity.

Unauthorized users must be prevented from accessing the admin_dashboard via direct UI manipulation.

4.3 Scalability
The system architecture must allow for the addition of new modules (e.g., Supplier Management) without refactoring existing code.

5. System Architecture (UML)
   
5.1 Use Case Diagram
   To visualize the interactions between the users and the system:

5.2 Database Entity Relationship (ERD)
The database will consist of four primary tables: Users, Products, Sales, and Sales_Items.

6. Proposed Tech Stack
   Backend: Java 17+ (Core Java, JDBC).

Frontend: JavaFX with FXML (Scene Builder).

Database: MySQL 8.0.

Build Tool: Maven.

Libraries: * BCrypt for security.

iText7 for PDF generation.

JFreeChart for analytics.