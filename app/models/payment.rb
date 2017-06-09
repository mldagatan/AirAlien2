class Payment < ActiveRecord::Base
  belongs_to :payable, polymorphic: true

  def self.payment_types
  	[
  		'Cash on Delivery',
  		'Bank Deposit',
  		'Credit Card',
  		'Paypal'
  	]
  end

  def self.statuses
  	[
  		'Pending',
  		'Paid',
  		# Completed status is for paypal
  		'Completed',
  		'Cancelled',
      'Declined'
  	]
  end

  def payment_type_readable
  	Payment.payment_types[self.payment_type]
  end

  def status_readable
  	Payment.statuses[self.status]
  end
end