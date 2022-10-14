# frozen_string_literal: true

require_relative "../../../../../test_helper"

# RepairOrderTest
class RepairOrderTest < MiniTest::Test
  def setup; end

  def test_that_fetch_returns_nil
    assert_nil RepairOrder.fetch(id: 1)
  end

  def test_that_list_returns_empty
    RepairOrder.stub :list, [] do
      response = RepairOrder.list
      assert_empty response
    end
  end

  def test_that_list_returns_data
    list_response = {
      data: [
        {
          id: "1245171",
          type: "repair_orders",
          attributes: {
            closed_at: "2022-07-18T09:49:48+00:00",
            created_at: "2022-07-18T09:24:05+00:00",
            is_estimate: false,
            is_quick_lube: true,
            state_closed: true,
            updated_at: "2022-07-18T09:49:51+00:00"
          },
          relationships: {
            appointment: {
              links: {
                related: ""
              }
            },
            customer: {
              links: {
                related: "localhost/public/api/v2/customers/462739"
              }
            },
            repair_shop: {
              links: {
                related: "localhost/public/api/v2/repair_shops/1"
              }
            },
            vehicle: {
              links: {
                related: "localhost/public/api/v2/vehicles/377677"
              }
            }
          }
        }
      ],
      meta: {
        stats: {
          total: {
            count: 3
          }
        }
      }
    }
    RepairOrder.stub :list, list_response do
      response = RepairOrder.list
      assert_equal "repair_orders", response[:data][0][:type]
      assert_equal 1, response[:data].length
      refute_nil(response[:data][0][:relationships][:appointment])
      refute_nil(response[:data][0][:relationships][:customer])
      refute_nil(response[:data][0][:relationships][:repair_shop])
      refute_nil(response[:data][0][:relationships][:vehicle])
    end
  end

  def test_that_fetch_returns_data
    fetch_response = {
      data: {
        id: "1245172",
        type: "repair_orders",
        attributes: {
          approval_status: "approved",
          approval_time: "",
          closed_at: "2022-07-18T09:53:17+00:00",
          created_at: "2022-07-18T09:52:03+00:00",
          customer_name: "Lowe Andrew",
          description: "",
          estimated_repair_time: "",
          finalized_at: "2022-07-18T09:53:16+00:00",
          is_estimate: false,
          is_refund: false,
          is_quick_lube: true,
          job_number: 2242,
          mileage_in: 1111,
          mileage_out: "",
          profit_center_id: 9,
          profit_center_name: "lube",
          service_advisor_name: "",
          state: "finalized",
          state_changed_at: "2022-07-18T09:53:16+00:00",
          technician_name: "",
          updated_at: "2022-07-18T09:53:19+00:00",
          vehicle_id: 377_678,
          vehicle_name: "2021 Acura ILX",
          warranty_or_policy: "",
          work_started_at: "2022-07-18T09:52:19+00:00",
          work_completed_at: "2022-07-18T09:53:16+00:00"
        },
        relationships: {
          appointment: {
            links: {
              related: ""
            },
            data: ""
          },
          customer: {
            links: {
              related: "localhost/public/api/v2/customers/524686"
            },
            data: ""
          },
          repair_shop: {
            links: {
              related: "localhost/public/api/v2/repair_shops/1"
            },
            data: {
              type: "repair_orders",
              id: "1"
            }
          },
          service_advisor: {
            links: {
              related: ""
            },
            data: ""
          },
          technician: {
            links: {
              related: ""
            },
            data: ""
          },
          vehicle: {
            links: {
              related: "localhost/public/api/v2/vehicles/377678"
            },
            data: {
              type: "vehicles",
              id: "377678"
            }
          },
          inspections: {
            links: {
              related: "localhost/public/api/v2/inspections?filter[job_id]=1245172"
            }
          }
        }
      },
      included: [
        {
          id: "1",
          type: "repair_orders",
          attributes: {
            active_sections: '["1", "2", "3", "4", "5", "6", "7"]',
            address: "2908 Cridge St, Riverside, CA 92507, USA",
            address2: "TEST user",
            brake_warranty_note: "",
            chain_id: 1,
            city: "Riverside",
            country: "United States",
            coupon_code: "",
            created_at: "2019-01-14T22:57:36+00:00",
            custom_id: "",
            default_hourly_rate: 11.0,
            default_contact_preference: "Text",
            demo: true,
            email: "cbademo@carserv.io",
            fee_tax: 0.0,
            fluid_tax: 8.25,
            invoice_disclaimer: "",
            itemize_labor_tax: false,
            kukui_access_code: "",
            kukui_location_key: "",
            kukui_security_key: "",
            labor_rate: 15.0,
            labor_tax: 0.0,
            last_login: "",
            location: {
              success: true,
              lat: 33.9670148,
              lng: -117.3719743,
              country_code: "US",
              city: "Riverside",
              state: "CA",
              zip: "92507",
              street_address: "2908 Cridge Street",
              district: "Riverside County",
              provider: "google",
              full_address: "2908 Cridge St, Riverside, CA 92507, USA",
              is_us?: true,
              ll: "33.9670148,-117.3719743",
              precision: "building",
              district_fips: "",
              state_fips: "",
              block_fips: "",
              sub_premise: ""
            },
            logo_url: "//files.carserv.io/shops/1/shop-logos/photos/c2468fc/featued-headless-ecommerce.jpg",
            marketing_opt_in_text: "",
            max_profit_percent: 70.0,
            min_profit_percent: 62.0,
            mycarfax_program: true,
            mycarfax_started_at: "2019-09-04T11:14:25+00:00",
            name: "CarServ Pilot Austin, TX",
            operator_id: "",
            owner_name: "",
            part_tax: 8.25,
            pending_data: "",
            phone: "(213) 584-9657",
            price_rounding: "",
            price_rounding_interval: 0.05,
            region_id: 7,
            rental_tax: 0.0,
            sales_tax: 8.25,
            signature_disclaimer: "www",
            state: "CA",
            sublet_tax: 0.0,
            supplies_max: 38.56,
            supplies_percent: 4.0,
            supplies_tax: 8.25,
            thank_you_note: "Thank you for choosing CarServ!!",
            third_party_note: "Test note",
            time_zone: "America/Los_Angeles",
            tires_tax: 8.25,
            tow_tax: 0.0,
            transactional_opt_in_text: "",
            updated_at: "2022-08-26T12:28:09+00:00",
            url: "",
            warranty_note: "",
            zip_code: 92_507
          }
        },
        {
          id: "377678",
          type: "vehicles",
          attributes: {
            aaia_id: "",
            aces_base_vehicle: "",
            annualmileage: "",
            car_model: "ILX",
            created_at: "2022-07-18T09:52:02+00:00",
            customer_id: 237_829,
            daily_mileage: 36,
            estimated_mileage: "",
            fleetunitno: "",
            last_repair_date: "",
            license_plate: "",
            make: "Acura",
            mileage: 1111,
            oil_capacity: 4.6,
            partstech_id: "",
            photo_url: "",
            previous_estimated_mileage: "",
            previous_viscosity: 2,
            price: 0,
            row_guid: "",
            state: "",
            stInspection: "",
            style_id: "",
            unit_id: "",
            updated_at: "2022-07-18T09:53:20+00:00",
            vcdb_base_vehicle_id: 154_148,
            vcdb_engine_config_id: 21_030,
            vcdb_style_config_id: "",
            vcdb_sub_model_id: "",
            vcdb_vehicle_id: "",
            veh_no: "",
            vehicle_engine_id: "",
            vehicle_model_year_id: "",
            vehicle_notes: "",
            vehicle_sub_model_id: "",
            vehicle_style_id: "",
            vin: "",
            year: 2021
          }
        }
      ],
      meta: {}
    }

    RepairOrder.stub :fetch, fetch_response do
      response = RepairOrder.fetch("1245172")
      assert_equal "repair_orders", response[:data][:type]
      refute_nil(response[:data][:relationships][:appointment])
      refute_nil(response[:data][:relationships][:customer])
      refute_nil(response[:data][:relationships][:repair_shop])
      refute_nil(response[:data][:relationships][:vehicle])
    end
  end
end
