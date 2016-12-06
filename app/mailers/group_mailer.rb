class GroupMailer < ApplicationMailer
  default from: "railstesting42@gmail.com"
  def match_confirmation(participant, giftee, group)
    @participant = participant
    @giftee = giftee
    @group = group

    mail to: participant.email, subject: "Sorteio do amigo oculto!"
  end
end
