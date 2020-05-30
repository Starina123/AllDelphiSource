object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'actMain'
      OnAction = WebModule1actMainAction
    end>
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object IdSMTP: TIdSMTP
    Left = 40
    Top = 28
  end
  object IdMessage: TIdMessage
    BccList = <>
    CCList = <>
    Recipients = <>
    ReplyTo = <>
    Left = 40
    Top = 76
  end
  object pgeError: TPageProducer
    HTMLDoc.Strings = (
      '<html><head><title> Oops ! </title></head>'
      '<body>'
      ''
      '<h1><font color = "Red">Error !</h1>'
      '<p>'
      '<#ERROR_MSG>'
      ''
      '</body>'
      '</html>')
    OnHTMLTag = pgeErrorHTMLTag
    Left = 212
    Top = 32
  end
  object pgeForm: TPageProducer
    HTMLDoc.Strings = (
      '<html><head><title>INDY CGI Mailer Demo</title></head>'
      '<body>'
      ''
      '<basefont face="Tahoma, Arial">'
      ''
      '<p>'
      
        '<h2><font color= "maroon">Welcome to the <a href="http://www.nev' +
        'rona.com/indy">INDY</a> CGI Mailer demo</h2>'
      '<p>'
      ''
      '<form action = "http://<#HOST><#SCRIPT>" method="post">'
      ''
      '<table border="1" bgcolor="#cc9999"><tr><td>'
      '<table border="0" align=center>'
      '<tr>'
      
        #9'<td>Sender email:</td><td><input type="text" name="sender" size' +
        ' = "30"></td>'
      '</tr>'
      '<tr>'
      
        #9'<td>To email:</td><td><input type="text" name="too" size = "30"' +
        '></td>'
      '</tr>'
      '<tr>'
      
        #9'<td>Subject:</td><td><input type="text" name="subject" size = "' +
        '50"></td>'
      '</tr>'
      '<tr>'
      
        #9'<td valign=top>Message body:</td><td><textarea name="body" cols' +
        ' = "50" rows ="10"></textarea></td>'
      '</tr>'
      '<tr>'
      #9'<td valign=top colspan="2"><hr></td>'
      '</tr>'
      '<tr>'
      
        #9'<td valign=top>SMTP Host:</td><td><input type="text" name="host' +
        '" size = "50"></td>'
      '</tr>'
      '<tr>'
      
        #9'<td valign=top>SMTP Username:</td><td><input type="text" name="' +
        'user" size = "50"></td>'
      '</tr>'
      ''
      '<tr>'
      
        #9'<td valign=top colspan="2" align="left"><input type="submit" va' +
        'lue="Send mail !"></td>'
      '</tr>'
      ''
      '</table>'
      '</td></tr></table>'
      ''
      '<p>'
      '</form>'
      '</body>'
      '</html>')
    OnHTMLTag = pgeFormHTMLTag
    Left = 212
    Top = 80
  end
  object pgeSuccess: TPageProducer
    HTMLDoc.Strings = (
      '<html><head><title> Success ! </title></head>'
      '<body>'
      ''
      '<h1><font color = "Green">Wahoo!!!</h1>'
      '<p>'
      'Message sent successfully !'
      '<p>'
      'Gooooooooooooo  <a href="http://www.nevrona.com/indy">INDY</a> !'
      '</body>'
      '</html>')
    Left = 216
    Top = 132
  end
end
