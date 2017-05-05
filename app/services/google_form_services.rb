require 'net/http'

class GoogleFormServices
  FormLink = "https://docs.google.com/a/hive-up.com/forms/d/e/1FAIpQLScw10epN1AHluo75ywC3WLbGyLkdV7QkScbytmTwtWrPzt68A/formResponse"
  def self.submit_form(params)
    post_data = {
      'entry.1538043803'=> params[:findoutmore],
      'entry.1736590642'=> params[:firstname],
      'entry.1034255236'=> params[:lastname],
      'entry.682267079'=> params[:email],
      'entry.634489823'=> params[:company],
      'entry.1765832471'=> params[:contact],
      'entry.1294555395'=> params[:your_answer]
    }
    uri = URI(FormLink)
    Net::HTTP.post_form(uri, post_data)
  end
end
