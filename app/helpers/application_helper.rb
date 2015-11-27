module ApplicationHelper

  # translate flash types (success, error, alert, notice) 
  # to bootstrap class names
  def bootstrap_class_for flash_type
    { "success" => "alert-success", 
      "error"   => "alert-danger", 
      "alert"   => "alert-warning", 
      "notice"  => "alert-info"      }[flash_type] || "nope"
  end

end
