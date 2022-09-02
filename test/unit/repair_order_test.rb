# frozen_string_literal: true

require 'test_helper'

class RepairOrderTest < MiniTest::Test
  def setup; end

  def test_that_fetch_returns_nil
    assert_nil RepairOrder.fetch({ id: 1 })
  end

  def test_that_list_returns_empty
    RepairOrder.stub :list, [] do
      response = RepairOrder.list
      assert_equal [], response
    end
  end

  def test_that_fetch_returns_data
    fetch_response = { id: '1245172', type: 'repair_orders',
                       relationships: { appointment: { data: ' ' }, customer: { data: ' ' } },
                       attributes: {
                         approval_status: 'approved', approval_time: ' ',
                         closed_at: '2022-07-18T09:53:17+00:00', created_at: '2022-07-18T09:52:03+00:00',
                         customer_name: 'Lowe Andrew', description: ' ', estimated_repair_time: ' ',
                         finalized_at: '2022-07-18T09:53:16+00:00', is_estimate: false, is_refund: false,
                         job_number: 2242, mileage_in: 1111, mileage_out: ' ', profit_center_id: 9,
                         profit_center_name: 'lube', service_advisor_name: ' ', state: 'finalized',
                         state_changed_at: '2022-07-18T09:53:16+00:00', technician_name: ' ',
                         updated_at: '2022-07-18T09:53:19+00:00', vehicle_id: 377_678,
                         vehicle_name: '2021 Acura ILX', warranty_or_policy: ' ',
                         work_started_at: '2022-07-18T09:52:19+00:00',
                         work_completed_at: '2022-07-18T09:53:16+00:00', labor_cost: 0.0,
                         labor_discount: 0.0, labor_margin: 0.0, labor_profit: 0.0,
                         labor_total: 0.0, labor_total_pre_tax: 0.0, other_cost: 0.0,
                         other_discount: 0.0, other_margin: 0.0, other_profit: 0.0, other_total: 0.0,
                         other_total_pre_tax: 0.0, parts_cost: 0.0, parts_discount: ' ',
                         parts_margin: 0.0, parts_profit: 0.0, parts_total: 0.0, parts_total_pre_tax: 0.0,
                         sublet_cost: 0.0, sublet_discount: 0.0, sublet_margin: 0.0,
                         sublet_profit: 0.0, sublet_total: 0.0, sublet_total_pre_tax: 0.0,
                         subtotal: 189.95, total: 189.95, total_cost: 0.0, total_discount: 0.0,
                         total_margin: 100.0, total_profit: 189.95, total_remaining: 0.0,
                         total_supplies: 0.0, total_tax: 0.0, work_hours: 0.0
                       } }

    RepairOrder.stub :fetch, fetch_response do
      response = RepairOrder.fetch('1245172')
      assert_equal 'repair_orders', response[:type]
    end
  end
end
