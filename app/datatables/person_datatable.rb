class PersonDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :person_path

  ID="id"

  def sortable_columns
    @sortable_columns ||= PersonAttribute.active.pluck(:column).map{ |e| [Person.to_s, e].join(".") }
  end

  def searchable_columns
    @searchable_columns ||= PersonAttribute.active.pluck(:column).map{ |e| [Person.to_s, e].join(".") }
  end

  private

  def data
    records.map do |record|
      extract_value_from_record(record)
    end
  end

  def get_raw_records
    columns = PersonAttribute.active.pluck(:column)
    Person.select(columns)
  end

  def extract_value_from_record(record)
    arr = []
    record.attributes.each do |k,v|
      if k==ID
        arr << link_to(v, person_path(v))
      else
        arr << v.to_s
      end
    end
    arr
  end
end
