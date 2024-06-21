class UserMailer <  ApplicationMailer


  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/success
  def success

    @page = params[:result].page
    mail to: "chris@gorails.com"
  end
end
