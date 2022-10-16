# Public Api Client

This gem is meant to help you to consume the CarServ Public APIs.

## Setup

Install the gem `client-0.0.1.gem`

Now in your application you need to create an initializer file to configure the API Credentials.

Example:

```ruby
# config/initializers/carserv.rb

require 'client'

Carserv::PublicApi::Client.configure do |config|
  config.api_key = <CARSERV_API_KEY>
  config.api_secret = <CARSERV_API_SECRET>
  config.faraday_adapter = ... # optional, choose from https://github.com/lostisland/awesome-faraday/#adapters
  config.items_per_page = 50 # optional, default is set to 50
end
```

## Usage

Please refer to below examples on how to use the 

```ruby
# Fetch ROs
repair_orders = Carserv::PublicApi::Client::RepairOrder.list(start_date: 2.days.ago, end_date: Time.now)

# Fetch a specific RO
repair_order = Carserv::PublicApi::Client::RepairOrder.fetch(id: 123)

# Fetch RO related Data
customer = ro.customer
vehicle = ro.vehicle
appointment = ro.appointment
tech = ro.technician
sa = ro.service_advisor
shop = ro.repair_shop
inspections = ro.inspections

ro.total
...

# Fetch Customers
customers = Carserv::PublicApi::Client::Customer.list(page: 2)

# Fetch a specific Customer
customer = Carserv::PublicApi::Client::Customer.fetch(id: 123)

# Fetch Customer related Data
vehicles = customer.vehicles
jobs = customer.jobs
```
