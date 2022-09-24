defmodule PrimerLive.FieldState do
  @moduledoc """
  State object with validation data for a particular form field.

  Struct fields:
  - `changeset` - `Ecto.Changeset` struct.
  - `field_errors` - changeset `errors`, filtered for the field.
  - `valid?` - True if changeset's `field_errors` is empty for the field.
  - `message` - Default message derived from changeset `errors`, unless overridden by `validation_message` attribute.
  - `message_id` - Generated id that is used for `aria_describedby`.
  """
  defstruct valid?: false, changeset: nil, message: nil, message_id: nil, field_errors: []
end
