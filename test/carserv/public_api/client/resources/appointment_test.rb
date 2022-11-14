# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Appointment do
  describe "#fetch" do
    context "when the appointment record is not present" do
      it "should return nil" do
        assert_nil Appointment.fetch(id: 1)
      end
    end

    context "when the appointment record is present" do
      it "should return valid response" do
        appointment_record = Appointment.new
        appointment_record.attributes = {
          "type" => "appointments",
          "id" => "67300",
          "created_at" => "2022-02-11T06:30:45+00:00",
          "start_time" => "2022-02-12T16:15:00+00:00",
          "end_time" => "2022-02-12T18:30:00+00:00",
          "profit_center_id" => 121,
          "profit_center_name" => "lube",
          "status" => "approved",
          "updated_at" => "2022-02-11T06:30:45+00:00"
        }

        Appointment.stub :fetch, appointment_record do
          appointment = Appointment.fetch("67300")
          assert_kind_of Appointment, appointment
          assert_equal "67300", appointment.id
        end
      end
    end
  end

  describe "#list" do
    context "when the appointment records not present" do
      it "should return empty list" do
        Appointment.stub :list, [] do
          response = Appointment.list
          assert_empty response
        end
      end
    end

    context "when the appointment records present" do
      it "should return list of appointment records" do
        appointments = [{
          "type" => "appointments",
          "id" => "67300",
          "created_at" => "2022-02-11T06:30:45+00:00",
          "start_time" => "2022-02-12T16:15:00+00:00",
          "end_time" => "2022-02-12T18:30:00+00:00",
          "profit_center_id" => 121,
          "profit_center_name" => "lube",
          "status" => "approved",
          "updated_at" => "2022-02-11T06:30:45+00:00"
        }]

        Appointment.stub :list, appointments do
          options = { filter: { customer_id: 1333 } }
          response = Appointment.list(options:)
          assert_equal "appointments", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
