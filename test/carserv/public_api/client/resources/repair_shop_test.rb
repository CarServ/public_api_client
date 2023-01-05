# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::RepairShop do
  describe "#fetch" do
    context "when the repair_shop record is not present" do
      it "should return nil" do
        assert_nil RepairShop.fetch(id: 900)
      end
    end

    context "when the repair_shop record is present" do
      it "should return valid RepairShop" do
        repair_shop_record = RepairShop.new
        repair_shop_record.attributes = {
          "type" => "repair_shops",
          "id" => "477",
          "address" => {
            "street_address1" => "3902 Louetta Rd, Springa, TX 77388, USA",
            "street_address2" => nil,
            "city" => "Spring",
            "state" => "TX",
            "zip" => "77388"
          },
          "chain_name" => "Caliber Auto Care",
          "created_at" => "2020-04-24T17:16:56+00:00",
          "custom_id" => "6001",
          "email" => "CAC-Spring-LouettaRd@CaliberAutoCare.com",
          "name" => "Caliber Auto Care - Spring",
          "phone_number" => "(281) 719-5599",
          "region_name" => "Houston",
          "updated_at" => "2022-10-12T08:20:34+00:00"
        }

        RepairShop.stub :fetch, repair_shop_record do
          repair_shop = RepairShop.fetch("477")
          assert_kind_of RepairShop, repair_shop
          assert_equal "477", repair_shop.id
        end
      end
    end
  end
end
