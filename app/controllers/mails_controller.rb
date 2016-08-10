class MailsController < ApplicationController
  before_action :set_mail, only: [:show]
  
  def index
    if !current_user.blank?
      @mails = gmail.inbox.emails.reverse
      unless @mails.kind_of?(Array)
        @mails = @mails.page(params[:page]).per(10)
      else
        @mails = Kaminari.paginate_array(@mails).page(params[:page]).per(10)
      end
    end
  end
  
  def show
    @subject = params[:subject]
    @message = params[:message]
  end
  
  def send_mail
    
    to = params[:to]
    subject = params[:subject]
    body = params[:body]
    
    gmail.deliver do
      to "#{to}"
      subject "#{subject}"
      text_part do
        body "#{body}"
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "#{body}"
      end
    end
    redirect_to mails_path
  end
  
  private
  
    def set_mail 
      @mail = gmail.inbox.find(uid: params[:uid])
    end
  
end
