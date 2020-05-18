# frozen_string_literal: true

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @@all << self
  end

  def self.all
    @@all
  end

  def execute_transaction
    if valid? && sender.balance > @amount && status == 'pending'
      receiver.balance += amount
      sender.balance -= amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      @status = 'reversed'
    end
  end

  def valid?
    sender.valid? && receiver.valid?
  end
end
