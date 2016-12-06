# Preview all emails at http://localhost:3000/rails/mailers/group_mailer
class GroupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/match_confirmation
  def match_confirmation
    group = Group.new
    group.name = "Festinha"

    participant = Participant.new
    participant.name = "Pessoa"
    participant.email = "exemplo.@ex.com"
    
    giftee = Participant.new
    giftee.name = "Viliro"
    giftee.email = "sorteado@ex.com"

    participant.giftee = giftee

    GroupMailer.match_confirmation(participant, participant.giftee, group)
  end

end
