# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Vehicle do
  describe "#fetch" do
    context "when the vehicle record is not present" do
      it "should return nil" do
        assert_nil Vehicle.fetch(id: 900)
      end
    end

    context "when the vehicle record is present" do
      it "should return valid Vehicle" do
        vehicle_record = Vehicle.new
        vehicle_record.attributes = {
          "type" => "vehicles",
          "id" => "143",
          "customer_id" => 143,
          "created_at" => "2020-04-26T22:53:29+00:00",
          "engine" => "1.9L - L4 - GAS",
          "license_plate" => "532GGK",
          "license_plate_state" => "TX",
          "make" => "Saturn", "mileage" => 0,
          "model" => "SC1", "style" => nil,
          "submodel" => "Base",
          "updated_at" => "2020-03-24T00:00:00+00:00",
          "vin" => "1G8ZE1286WZ182206",
          "year" => "1998"
        }

        Vehicle.stub :fetch, vehicle_record do
          vehicle = Vehicle.fetch("143")
          assert_kind_of Vehicle, vehicle
          assert_equal "143", vehicle.id
        end
      end
    end
  end

  describe "#list" do
    context "when the vehicle records not present" do
      it "should return empty list" do
        Vehicle.stub :list, [] do
          response = Vehicle.list
          assert_empty response
        end
      end
    end

    context "when the vehicle records present" do
      it "should return list of vehicle records" do
        vehicles = [{
          "type" => "vehicles",
          "id" => "12111",
          "customer_id" => 143,
          "created_at" => "2020-04-26T22:53:29+00:00",
          "engine" => "1.9L - L4 - GAS",
          "license_plate" => "532GGK",
          "license_plate_state" => "TX",
          "make" => "Saturn", "mileage" => 0,
          "model" => "SC1", "style" => nil,
          "submodel" => "Base",
          "updated_at" => "2020-03-24T00:00:00+00:00",
          "vin" => "1G8ZE1286WZ182206",
          "year" => "1998"
        }]

        Vehicle.stub :list, vehicles do
          options = { filter: { customer_id: 143 } }
          response = Vehicle.list(options:)
          assert_equal "vehicles", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
