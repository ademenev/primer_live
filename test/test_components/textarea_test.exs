defmodule PrimerLive.TestComponents.TextareaTest do
  use ExUnit.Case
  use PrimerLive
  import PrimerLive.Helpers.TestHelpers

  import Phoenix.Component
  import Phoenix.LiveViewTest

  test "Called without options: should render the component" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea />
           """)
           |> format_html() ==
             """
             <textarea class="form-control" id="_" name="[]"></textarea>
             """
             |> format_html()
  end

  test "Attribute: is_large" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea is_large />
           """)
           |> format_html() ==
             """
             <textarea class="form-control input-lg" id="_" name="[]"></textarea>
             """
             |> format_html()
  end

  test "Attribute: is_small" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea is_small />
           """)
           |> format_html() ==
             """
             <textarea class="form-control input-sm" id="_" name="[]"></textarea>
             """
             |> format_html()
  end

  test "Attribute: is_short without form_group: should render an error message" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea is_short />
           """)
           |> format_html() ==
             """
             attr is_short: must be used in combination with a group slot
             """
             |> format_html()
  end

  test "Attribute: is_short with form_group" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea form={:f} field={:first_name} is_short is_group />
           """)
           |> format_html() ==
             """
             <div class="form-group"><div class="form-group-header"><label for="f_first_name">First name</label></div>
             <div class="form-group-body"><textarea class="form-control short" id="f_first_name" name="f[first_name]"></textarea>
             </div>
             </div>
             """
             |> format_html()
  end

  test "Attribute: class" do
    assigns = []

    assert rendered_to_string(~H"""
           <.test_textarea class="x" />
           """)
           |> format_html() ==
             """
             <textarea class="form-control x" id="_" name="[]"></textarea>
             """
             |> format_html()
  end
end
