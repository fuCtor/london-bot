Sequel.migration do
  up do
    create_table(:flats) do
      primary_key :id
      Integer :section
      Integer :flat
      Integer :number, index: true
      Integer :rooms
      Float :area
      Integer :bti_section
      Integer :bti_flat
      Integer :bti_number, index: true
      Integer :bti_rooms
      Float :bti_area
      Boolean :completed
      String :comment

      Time :updated_at
      Time :created_at
    end
  end

  down do
    drop_table(:flats)
  end
end