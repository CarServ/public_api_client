# Public Api Client

This gem is meant to help you to consume the CarServ Public APIs.

## Setup

Install the gem `carserv_public_api_client-0.0.1.gem`

Now in your application you need to create an initializer file to configure the API Credentials.

Example:

```ruby
# config/initializers/carserv.rb

require 'carserv_public_api_client'

Carserv::PublicApi::Client.configure do |config|
  config.api_key = <CARSERV_API_KEY>
  config.api_secret = <CARSERV_API_SECRET>
  config.faraday_adapter = ... # optional, choose from https://github.com/lostisland/awesome-faraday/#adapters
  config.items_per_page = 50 # optional, default is set to 50
end
```

## Usage

Below are some examples on how to use the client:

```ruby
# Fetch ROs
# Filter the list of repair orders based on the `closed_at` attribute (when the RO was closed) by providing the `start_date` and `end_date` params
# they default to today's beginning of day and end of day.
repair_orders = Carserv::PublicApi::Client::RepairOrder.list(start_date: 2.days.ago, end_date: Time.now)

# Fetch a specific RO
repair_order = Carserv::PublicApi::Client::RepairOrder.fetch(id: 123)

# Fetch RO related Data
customer = repair_order.customer
vehicle = repair_order.vehicle
appointment = repair_order.appointment
tech = repair_order.technician
sa = repair_order.service_advisor
shop = repair_order.repair_shop
inspections = repair_order.inspections
operations = repair_order.operations

parts = operations.first.parts
labors = operations.first.labors
sublets = operations.first.sublets
others = operations.first.others

repair_order.total
...

# Fetch Customers
# Filter the list of customers based on the `business_name` `email` `first_name` `last_name` `phone_number` `is_fleet`, by providing the filter key and its value
# options default to {}
options = {filter: {first_name: 'test'}}
options = {filter: {last_name: 'test'}}
options = {filter: {business_name: 'test_buisness'}}
options = {filter: {email: 'testets@gmail.com'}}
options = {filter: {is_fleet: true, email: 'testets@gmail.com'}}
customers = Carserv::PublicApi::Client::Customer.list(options: options, page: 2)

# Fetch a specific Customer
customer = Carserv::PublicApi::Client::Customer.fetch(id: 123)

# Fetch Customer related Data
vehicles = customer.vehicles
jobs = customer.jobs
```
