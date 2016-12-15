module Acme::SessionsHelper
  def mobile_verification_button
   return '' unless current_user.needs_mobile_number_verifying?
   html = <<-HTML
     <h3>Verify Mobile Number</h3>
     #{form_tag(verifications_path, method: "post")}
     #{button_tag('Send verification code', type: "submit")}
     </form>
   HTML
   html.html_safe
 end
end
