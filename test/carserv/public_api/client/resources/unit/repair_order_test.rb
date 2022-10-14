# frozen_string_literal: true

require_relative "../../../../../test_helper"

describe "#fetch" do
  context "when the repair order record is not present" do
    it "should return nil" do
      assert_nil RepairOrder.fetch(id: 1)
    end
  end

  context "when the repair order record is present" do
    it "should return valid response" do
      repair_order_record = RepairOrder.new
      repair_order_record.attributes = { "type" => "repair_orders",
                                         "id" => "1245145",
                                         "approval_status" => "approved",
                                         "approval_time" => "2021-11-30T09:10:31+00:00",
                                         "closed_at" => "2021-11-30T09:11:03+00:00",
                                         "created_at" => "2021-11-30T08:55:56+00:00",
                                         "customer_name" => "Chris Olivarez",
                                         "description" => nil,
                                         "estimated_repair_time" => nil,
                                         "finalized_at" => "2021-11-30T09:10:49+00:00",
                                         "is_estimate" => false,
                                         "is_refund" => false,
                                         "is_quick_lube" => false,
                                         "job_number" => 6_001_181_185,
                                         "mileage_in" => 2222,
                                         "mileage_out" => 11_111,
                                         "original_type" => nil,
                                         "profit_center_id" => 121,
                                         "profit_center_name" => "lube",
                                         "service_advisor_name" => "Anthony Buckley",
                                         "state" => "finalized",
                                         "state_changed_at" => "2021-11-30T09:10:49+00:00",
                                         "technician_name" => "Anthony Buckley",
                                         "updated_at" => "2021-11-30T09:39:40+00:00",
                                         "vehicle_id" => 376_489,
                                         "vehicle_name" => "2016 Jeep Compass",
                                         "warranty_or_policy" => nil,
                                         "work_started_at" => "2021-11-30T09:10:38+00:00",
                                         "work_completed_at" => "2021-11-30T09:10:49+00:00" }

      RepairOrder.stub :fetch, repair_order_record do
        repair_order = RepairOrder.fetch("1245145")
        assert_kind_of RepairOrder, repair_order
        assert_equal "1245145", repair_order.id
      end
    end
  end

  context "when the repair order has the associated customer" do
    it "should return customer" do
      mock_customer = { "type" => "customers",
                        "id" => "246443",
                        "address" => nil,
                        "birthday" => nil,
                        "business_name" => "Donald Evans",
                        "company_name" => nil,
                        "contact_preference" => nil,
                        "created_at" => "2021-08-07T18:50:11+00:00",
                        "emails" => [{ "email_address" => "donaldevans77@yahoo.com",
                                       "is_primary" => true }],
                        "first_name" => "Donald",
                        "is_fleet" => false,
                        "last_name" => "Evans",
                        "marketing_optn" => true,
                        "phone_numbers" => [{ "phone_number" => "+12817716056", "is_primary" => true,
                                              "description" => "mobile_phone" }],
                        "transactional_optn" => true,
                        "updated_at" => "2021-08-07T18:50:11+00:00" }
      mock_repair_order = MiniTest::Mock.new
      mock_repair_order.expect :customer, mock_customer
      RepairOrder.stub :new, mock_repair_order do
        repair_order = RepairOrder.new
        customer = repair_order.customer
        refute_nil customer
      end
    end
  end
end

describe "#list" do
  context "when the repair order records not present" do
    it "should return empty list" do
      RepairOrder.stub :list, [] do
        response = RepairOrder.list
        assert_empty response
      end
    end
  end

  context "when the repair order records present" do
    it "should return list of repair order records" do
      repair_orders = [
        { "type" => "repair_orders",
          "id" => "1088808",
          "closed_at" => "2021-01-02T14:42:57+00:00",
          "created_at" => "2021-01-02T14:03:16+00:00",
          "is_estimate" => false,
          "is_quick_lube" => false,
          "original_type" => "standard",
          "state_closed" => true,
          "updated_at" => "2022-10-12T11:42:48+00:00",
          "customers_repair_shop_id" => 266_194 }
      ]
      RepairOrder.stub :list, repair_orders do
        response = RepairOrder.list
        assert_equal "repair_orders", response.first["type"]
        assert_equal 1, response.length
      end
    end
  end
end
