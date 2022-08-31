defmodule PrimerLive.Components.DropdownTest do
  use ExUnit.Case
  use PrimerLive
  import PrimerLive.Helpers.TestHelpers

  import Phoenix.LiveView.Helpers
  import Phoenix.LiveViewTest

  test "Called without options or inner_block: should render an error message" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown />
           """)
           |> format_html() ==
             """
             <div class="flash flash-error"><p>dropdown component received invalid options:</p><p>inner_block: can&#39;t be blank</p><p>label: can&#39;t be blank</p></div>
             """
             |> format_html()
  end

  test "Called without options: should render an error message" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown>Content</.dropdown>
           """)
           |> format_html() ==
             """
             <div class="flash flash-error"><p>dropdown component received invalid options:</p><p>label: can&#39;t be blank</p></div>
             """
             |> format_html()
  end

  test "Called with label: should render the dropdown element" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown>
             <:label>Label</:label>
             Content
           </.dropdown>
           """)
           |> format_html() ==
             """
             <details class="dropdown details-reset details-overlay d-inline-block"><summary class="btn" aria-haspopup="true">Label<div class="dropdown-caret"></div></summary> Content</details>
             """
             |> format_html()
  end

  test "Option: class" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown class="x">
             <:label>Label</:label>
             Content
           </.dropdown>
           """)
           |> format_html() ==
             """
             <details class="dropdown details-reset details-overlay d-inline-block x"><summary class="btn" aria-haspopup="true">Label<div class="dropdown-caret"></div></summary> Content</details>
             """
             |> format_html()
  end

  test "Option: classes" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown classes={
             %{
               dropdown: "dropdown-x",
               button: "button-x",
               caret: "caret-x"
             }
           }>
             <:label>Label</:label>
             Content
           </.dropdown>
           """)
           |> format_html() ==
             """
             <details class="dropdown details-reset details-overlay d-inline-block dropdown-x"><summary class="button-x" aria-haspopup="true">Label<div class="dropdown-caret caret-x"></div></summary> Content</details>
             """
             |> format_html()
  end

  test "Extra attributes" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown dir="rtl">
             <:label>Label</:label>
             Content
           </.dropdown>
           """)
           |> format_html() ==
             """
             <details class="dropdown details-reset details-overlay d-inline-block" dir="rtl"><summary class="btn" aria-haspopup="true">Label<div class="dropdown-caret"></div></summary> Content</details>
             """
             |> format_html()
  end

  test "Full menu" do
    assigns = []

    assert rendered_to_string(~H"""
           <.dropdown
             open
             class="dropdown-x"
             classes={
               %{
                 button: "btn button-x"
               }
             }
           >
             <:label>
               <.octicon name="alert-16" />
             </:label>
             <.dropdown_menu position="s">
               <:header>Header</:header>
               <.dropdown_item href="#url">Dropdown item 1</.dropdown_item>
               <.dropdown_item href="#url">Dropdown item 2</.dropdown_item>
               <.dropdown_item is_divider />
               <.dropdown_item href="#url">Dropdown item 3</.dropdown_item>
             </.dropdown_menu>
           </.dropdown>
           """)
           |> format_html() ==
             """
             <details class="dropdown details-reset details-overlay d-inline-block dropdown-x" open>
             <summary class="btn button-x" aria-haspopup="true">
             <svg class="octicon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path></svg>
             <div class="dropdown-caret"></div>
             </summary>
             <ul class="dropdown-menu dropdown-menu-s"><div class="dropdown-header">Header</div><li class="dropdown-item" href="#url">Dropdown item 1</li><li class="dropdown-item" href="#url">Dropdown item 2</li><li class="dropdown-divider"></li><li class="dropdown-item" href="#url">Dropdown item 3</li></ul>
             </details>
             """
             |> format_html()
  end
end
