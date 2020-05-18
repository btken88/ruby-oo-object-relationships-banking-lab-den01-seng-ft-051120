# frozen_string_literal: true

class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@all << self
  end

  def self.all
    @@all
  end

  def close_account
    @balance = 0
    @status = 'closed'
  end

  def deposit(amount)
    if status == 'open'
      @balance += amount
    else
      'This account is closed'
    end
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    status == 'open' && balance > 0
  end
end
