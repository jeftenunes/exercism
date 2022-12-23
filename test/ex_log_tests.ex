defmodule ExLogTest do
  use ExUnit.Case

  describe "ExLog.to_label/2" do
    @tag task_id: 1
    test "level 0 has label trace only in a non-legacy app" do
      assert ExLog.to_label(0, false) == :trace
      assert ExLog.to_label(0, true) == :unknown
    end

    @tag task_id: 1
    test "level 1 has label debug" do
      assert ExLog.to_label(1, false) == :debug
      assert ExLog.to_label(1, true) == :debug
    end

    @tag task_id: 1
    test "level 2 has label info" do
      assert ExLog.to_label(2, false) == :info
      assert ExLog.to_label(2, true) == :info
    end

    @tag task_id: 1
    test "level 3 has label warning" do
      assert ExLog.to_label(3, false) == :warning
      assert ExLog.to_label(3, true) == :warning
    end

    @tag task_id: 1
    test "level 4 has label error" do
      assert ExLog.to_label(4, false) == :error
      assert ExLog.to_label(4, true) == :error
    end

    @tag task_id: 1
    test "level 5 has label fatal only in a non-legacy app" do
      assert ExLog.to_label(5, false) == :fatal
      assert ExLog.to_label(5, true) == :unknown
    end

    @tag task_id: 1
    test "level 6 has label unknown" do
      assert ExLog.to_label(6, false) == :unknown
      assert ExLog.to_label(6, true) == :unknown
    end

    @tag task_id: 1
    test "level -1 has label unknown" do
      assert ExLog.to_label(-1, false) == :unknown
      assert ExLog.to_label(-1, true) == :unknown
    end
  end

  describe "ExLog.alert_recipient/2" do
    @tag task_id: 2
    test "fatal code sends alert to ops" do
      assert ExLog.alert_recipient(5, false) == :ops
    end

    @tag task_id: 2
    test "error code sends alert to ops" do
      assert ExLog.alert_recipient(4, false) == :ops
      assert ExLog.alert_recipient(4, true) == :ops
    end

    @tag task_id: 2
    test "unknown code sends alert to dev team 1 for a legacy app" do
      assert ExLog.alert_recipient(6, true) == :dev1
      assert ExLog.alert_recipient(0, true) == :dev1
      assert ExLog.alert_recipient(5, true) == :dev1
    end

    @tag task_id: 2
    test "unknown code sends alert to dev team 2" do
      assert ExLog.alert_recipient(6, false) == :dev2
    end

    @tag task_id: 2
    test "trace code does not send alert" do
      assert ExLog.alert_recipient(0, false) == false
    end

    @tag task_id: 2
    test "debug code does not send alert" do
      assert ExLog.alert_recipient(1, false) == false
      assert ExLog.alert_recipient(1, true) == false
    end

    @tag task_id: 2
    test "info code does not send alert" do
      assert ExLog.alert_recipient(2, false) == false
      assert ExLog.alert_recipient(2, true) == false
    end

    @tag task_id: 2
    test "warning code does not send alert" do
      assert ExLog.alert_recipient(3, false) == false
      assert ExLog.alert_recipient(3, true) == false
    end
  end
end
