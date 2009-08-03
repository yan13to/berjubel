class Asset < ActiveRecord::Base

  #id: integer
  #name: string
  #content_type: string
  #size: integer
  #object_id: integer
  #object_type: string

  belongs_to :object, :polymorphic => true

  def file=(file_data)
    @file_data = file_data unless file_data.blank?
    build_values unless @file_data.blank?
  end

  private

  def build_values
    self.name = @file_data.original_filename.split('.').last.downcase
    self.content_type = @file_data.content_type.chomp
  end

  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end

end
