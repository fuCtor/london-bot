Sequel.migration do
  up do
    create_table(:notifications) do
      primary_key :id
      Integer :user_id
      Integer :number
      Boolean :complete, default: false

      Time :updated_at
      Time :created_at
    end
  end

  down do
    drop_table(:notifications)
  end
end