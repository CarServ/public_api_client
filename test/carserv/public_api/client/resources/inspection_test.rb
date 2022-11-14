# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Inspection do
  describe "#fetch" do
    context "when the inspection record is not present" do
      it "should return nil" do
        assert_nil Inspection.fetch(id: 1)
      end
    end

    context "when the inspection record is present" do
      it "should return valid response" do
        inspection_record = Inspection.new
        inspection_record.attributes = {
          "type" => "inspections",
          "id" => "423069",
          "created_at" => "2021-11-30T08:55:56+00:00",
          "dvi_sent_at" => nil, "image_count" => 0,
          "name" => "Maintenance Inspection v.3",
          "percent_complete" => 0,
          "sent" => false,
          "updated_at" => "2021-11-30T08:55:56+00:00",
          "video_count" => 0
        }

        Inspection.stub :fetch, inspection_record do
          inspection = Inspection.fetch(id: "423069")
          assert_kind_of Inspection, inspection
          assert_equal "423069", inspection.id
        end
      end
    end
  end

  describe "#list" do
    context "when the inspection records not present" do
      it "should return empty list" do
        Inspection.stub :list, [] do
          response = Inspection.list
          assert_empty response
        end
      end
    end

    context "when the inspection records present" do
      it "should return list of inspection records" do
        inspections = [{
          "type" => "inspections",
          "id" => "423069",
          "created_at" => "2021-11-30T08:55:56+00:00",
          "dvi_sent_at" => nil, "image_count" => 0,
          "name" => "Maintenance Inspection v.3",
          "percent_complete" => 0,
          "sent" => false,
          "updated_at" => "2021-11-30T08:55:56+00:00",
          "video_count" => 0
        }]

        Inspection.stub :list, inspections do
          options = { filter: { job_id: 143 } }
          response = Inspection.list(options)
          assert_equal "inspections", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
