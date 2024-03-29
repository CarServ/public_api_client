# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Customer do
  describe "#fetch" do
    context "when the customer record is not present" do
      it "should return nil" do
        assert_nil Customer.fetch(id: 1)
      end
    end

    context "when the customer record is present" do
      it "should return valid response" do
        customer_record = Customer.new
        customer_record.attributes = {
          "type" => "customers",
          "id" => "246443",
          "address" => nil,
          "birthday" => nil,
          "business_name" => "Donald Evans",
          "company_name" => nil,
          "contact_preference" => nil,
          "created_at" => "2021-08-07T18:50:11+00:00",
          "emails" => [{
            "email_address" => "donaldevans77@yahoo.com",
            "is_primary" => true
          }],
          "first_name" => "Donald",
          "is_fleet" => false,
          "last_name" => "Evans",
          "marketing_optn" => true,
          "phone_numbers" => [{
            "phone_number" => "+12817716056",
            "is_primary" => true,
            "description" => "mobile_phone"
          }],
          "transactional_optn" => true,
          "updated_at" => "2021-08-07T18:50:11+00:00"
        }

        Customer.stub :fetch, customer_record do
          customer = Customer.fetch(id: "246443")
          assert_kind_of Customer, customer
          assert_equal "246443", customer.id
        end
      end
    end

    context "when the customer has the associated jobs" do
      it "should return jobs" do
        jobs_response = [{
          "type" => "repair_orders",
          "id" => "993957",
          "closed_at" => "2015-06-06T18:30:46+00:00",
          "created_at" => "2015-06-06T05:00:00+00:00",
          "is_estimate" => false,
          "is_quick_lube" => false,
          "original_type" => nil,
          "state_closed" => true,
          "updated_at" => "2020-11-27T21:24:13+00:00",
          "customers_repair_shop_id" => 263_662
        }]

        mock_customer = MiniTest::Mock.new
        mock_customer.expect :jobs, jobs_response

        Customer.stub :new, mock_customer do
          customer = Customer.new
          customer_jobs = customer.jobs
          refute_nil customer_jobs
        end
      end
    end
  end

  describe "#list" do
    context "when the customer records not present" do
      it "should return empty list" do
        Customer.stub :list, [] do
          response = Customer.list
          assert_empty response
        end
      end
    end

    context "when the customer records present" do
      it "should return list of customer records" do
        customer_records = [{
          "type" => "customers",
          "id" => "120450",
          "address" => "",
          "birthday" => "2017-03-17T00:00:00+00:00",
          "business_name" => " ,",
          "company_name" => nil,
          "contact_preference" => "Text",
          "created_at" => "2020-04-26T22:01:50+00:00",
          "emails" => [{
            "email_address" => "",
            "is_primary" => true
          }],
          "first_name" => nil,
          "is_fleet" => false,
          "last_name" => ",",
          "marketing_optn" => true,
          "phone_numbers" => [
            {
              "phone_number" => "+12817900997",
              "is_primary" => true,
              "description" => "mobile_phone"
            },
            {
              "phone_number" => "+12817900997",
              "is_primary" => false,
              "description" => "home_phone"
            }
          ],
          "transactional_optn" => true,
          "updated_at" => "2020-11-27T19:22:38+00:00"
        }]

        Customer.stub :list, customer_records do
          response = Customer.list
          assert_equal "customers", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
