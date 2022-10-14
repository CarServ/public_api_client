# frozen_string_literal: true

require_relative "../../../../../test_helper"

describe "#fetch" do
  context "when the customer record is not present" do
    it "should return nil" do
      assert_nil Customer.fetch(id: 1)
    end
  end

  context "when the customer record is present" do
    it "should return valid response" do
      fetch_response = {
        data: {
          id: "205701",
          type: "customers",
          attributes: {
            address: "Austin, TX, USA",
            birthday: " ",
            business_name: "Alpha Abc",
            company_name: " ",
            contact_preference: "Text",
            created_at: "2021-01-20T08:24:05+00:00",
            emails: [
              {
                email_address: "asd@gmail.com",
                is_primary: true
              }
            ],
            first_name: "Alpha",
            is_fleet: false,
            last_name: "Abc",
            marketing_optn: true,
            phone_numbers: [
              {
                phone_number: "+12043456786",
                is_primary: true,
                description: " "
              }
            ],
            transactional_optn: true,
            updated_at: "2021-11-11T06:32:06+00:00"
          },
          relationships: {
            fleet: {
              links: {
                related: " "
              }
            },
            appointments: {
              links: {
                related: "localhost/public/api/v2/appointments?filter[customer_id]=205701"
              },
              data: []
            },
            jobs: {
              links: {
                related: "localhost/public/api/v2/repair_orders?filter[customer_id]=205701"
              },
              data: []
            },
            vehicles: {
              links: {
                related: "localhost/public/api/v2/vehicles?filter[customer_id]=205701"
              },
              data: []
            }
          }
        },
        included: [],
        meta: {}
      }

      Customer.stub :fetch, fetch_response do
        response = Customer.fetch(id: 205_701)
        assert_equal "customers", response[:data][:type]
        assert_equal "205701", response[:data][:id]
        refute_nil(response[:data][:relationships][:appointments])
        refute_nil(response[:data][:relationships][:jobs])
        refute_nil(response[:data][:relationships][:vehicles])
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
      list_response = {
        data: [
          {
            id: "243674",
            type: "customers",
            attributes: {
              address: " ",
              birthday: " ",
              business_name: ". .",
              company_name: " ",
              contact_preference: "Text",
              created_at: "2021-07-25T06:59:00+00:00",
              emails: [
                {
                  email_address: " ",
                  is_primary: true
                }
              ],
              first_name: ".",
              is_fleet: false,
              last_name: ".",
              marketing_optn: true,
              phone_numbers: [
                {
                  phone_number: "+18582334567",
                  is_primary: true,
                  description: " "
                }
              ],
              transactional_optn: true,
              updated_at: "2021-07-25T06:59:00+00:00"
            },
            relationships: {
              fleet: {
                links: {
                  related: " "
                }
              },
              appointments: {
                links: {
                  related: "localhost/public/api/v2/appointments?filter[customer_id]=243674"
                },
                data: []
              },
              jobs: {
                links: {
                  related: "localhost/public/api/v2/repair_orders?filter[customer_id]=243674"
                },
                data: []
              },
              vehicles: {
                links: {
                  related: "localhost/public/api/v2/vehicles?filter[customer_id]=243674"
                },
                data: [
                  {
                    type: "vehicles",
                    id: "372280"
                  }
                ]
              }
            }
          }
        ],
        meta: {}
      }
      Customer.stub :list, list_response do
        response = Customer.list
        assert_equal "customers", response[:data][0][:type]
        assert_equal 1, response[:data].length
        refute_nil(response[:data][0][:relationships][:appointments])
        refute_nil(response[:data][0][:relationships][:jobs])
        refute_nil(response[:data][0][:relationships][:vehicles])
      end
    end
  end
end
