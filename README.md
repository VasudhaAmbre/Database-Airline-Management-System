# Airline Management System (AMS)

## Description
The Airline Management System (AMS) is a comprehensive solution designed to optimize airport operations and enhance passenger experiences. It integrates various functionalities such as flight scheduling, passenger management, crew assignments, and reporting to support efficient and data-driven decision-making for airport authorities.

## Objectives
- **Efficient Flight Management**: Enables the tracking and management of flights, including scheduling, departure, and arrival details.
- **Streamlined Passenger Experience**: Provides a user-friendly interface for online ticket booking, and comprehensive booking management.
- **Effective Employee Management**: Facilitates the management of crew schedules and assignments, optimizing workforce utilization.
- **Data-Driven Insights**: Equips airport authorities with valuable data to inform strategic decisions and improve operational efficiencies.

## System Overview
AMS encompasses several key entities including Airlines, Flights, Airports, Routes, Employees, Passengers, and Bookings, with robust relationships established to ensure data integrity and seamless information flow.

### Key Entities and Their Attributes
- **Airlines**: `airline_id` (PK), `name`
- **Flights**: `flight_id` (PK), `airline_id` (FK), `departure_time`, `arrival_time`, `status`, `price`
- **Passengers**: `passenger_id` (PK), `full_name`, `email`, `phone`
- **Employees**: `emp_id` (PK), `first_name`, `last_name`, `job_title`

## Tech Stack
- **Backend**: Java, SQL
- **Frontend**: HTML, CSS, JavaScript (Framework of choice)
- **Database**: MySQL

## Database Schema
The schema supports complex queries essential for the dynamic nature of airline management, with tables designed for scalability and efficiency.
