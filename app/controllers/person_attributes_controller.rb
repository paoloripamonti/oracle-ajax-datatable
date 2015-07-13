class PersonAttributesController < ApplicationController

  # PATCH/PUT /ajax_upload_person_attributes
  def upload_columns
    columns = params[:col].keys if params[:col]
    if columns && columns!=[]
      PersonAttribute.update_all(:active=>false)
      PersonAttribute.where(:id => columns).update_all(:active=>true)
    end
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Columns was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
