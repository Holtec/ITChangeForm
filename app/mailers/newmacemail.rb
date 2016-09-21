class Newmacemail < ApplicationMailer
  def new_request_email(email, division, what, why, when1, how, success, rollback, id)
    @email = email
    @division = division
    @what = what
    @why = why
    @when = when1
    @how = how
    @success = success
    @rollback = rollback
    @id = id
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "New MAC Request, ID: #{@id}")
  end
  
  def edit_request_email(email, division, what, why, when1, how, success, rollback, id)
    @email = email
    @division = division
    @what = what
    @why = why
    @when = when1
    @how = how
    @success = success
    @rollback = rollback
    @id = id
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "Revised MAC Request, ID: #{@id}")
  end
  
  def new_comment_email(email, id, content)
    @email = email
    @id = id
    @content = content
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "New MAC Comment, ID: #{@id}")
  end
  
  def approve_request_email(email, id)
    @email = email
    @id = id
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "MAC ID: #{@id} APPROVED")
  end
  
  def deny_request_email(email, id, reason)
    @email = email
    @id = id
    @reason = reason
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "MAC ID: #{@id} DENIED")
  end
  
  def succeeded_request_email(email, id, successreason)
    @email = email
    @id = id
    @reason = successreason
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "MAC ID: #{@id} SUCCEEDED")
  end
  
  def failed_request_email(email, id, failedreason)
    @email = email
    @id = id
    @reason = failedreason
    mail(from: @email, to: ENV['MACEMAILTOREQUEST'], subject: "MAC ID: #{@id} FAILED")
  end
end
