# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Technician do
  describe "#fetch" do
    context "when the technician record is not present" do
      it "should return nil" do
        assert_nil Technician.fetch(id: 900)
      end
    end

    context "when the technician record is present" do
      it "should return valid Technician" do
        technician_record = Technician.new
        technician_record.attributes = {
          "type" => "technicians",
          "id" => "1665",
          "active" => true,
          "created_at" => "2020-05-28T16:34:49+00:00",
          "employee_id" => "522149",
          "first_name" => "Anthony",
          "hourly_rate" => 12.87,
          "last_name" => "Buckley",
          "name" => "Anthony Buckley",
          "updated_at" => "2021-02-11T01:13:47+00:00"
        }

        Technician.stub :fetch, technician_record do
          technician = Technician.fetch("1665")
          assert_kind_of Technician, technician
          assert_equal "1665", technician.id
        end
      end
    end
  end

  describe "#list" do
    context "when the technician records not present" do
      it "should return empty list" do
        Technician.stub :list, [] do
          response = Technician.list
          assert_empty response
        end
      end
    end

    context "when the technician records present" do
      it "should return list of technician records" do
        technicians = [{
          "type" => "technicians",
          "id" => "1665",
          "active" => true,
          "created_at" => "2020-05-28T16:34:49+00:00",
          "employee_id" => "522149",
          "first_name" => "Anthony",
          "hourly_rate" => 12.87,
          "last_name" => "Buckley",
          "name" => "Anthony Buckley",
          "updated_at" => "2021-02-11T01:13:47+00:00"
        }]

        Technician.stub :list, technicians do
          response = Technician.list
          assert_equal "technicians", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
