module ScribdFuHelper
  
  # Displays the scribd object for the attachment on the given +object+.
  #
  # If you are using Paperclip, you must also specify the +attribute+ on
  # which the scribd object exists.
  def display_scribd(object, options = {})
    if options[:attribute]
      scribd_id = object.send "#{attribute}_scribd_id"
      scribd_ak = object.send "#{attribute}_scribd_access_key"
    else
      scribd_id = object.scribd_id
      scribd_ak = object.scribd_access_key
    end
    <<-END
      <script type=\"text/javascript\" src=\"http://www.scribd.com/javascripts/view.js\"></script>
      <div id=\"embedded_flash\">#{options[:alt_text]}</div>
      <script type=\"text/javascript\">
        var scribd_doc = scribd.Document.getDoc(#{scribd_id}, '#{scribd_ak}');
        scribd_doc.write(\"embedded_flash\");
      </script>
    END
  end
  
  def include_scribd_js
    javascript_include_tag 'http://www.scribd.com/javascripts/view.js'
  end
  
  def include_scribd_if_needed
    include_scribd_js if using_scribd?
  end
  
  def using_scribd?
    @uses_scribd
  end
  
end