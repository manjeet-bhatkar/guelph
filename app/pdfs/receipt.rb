class Receipt < Prawn::Document
	require 'open-uri'
  def initialize(donation)
    image_url = Rails.root.join('app','assets','images','pdf_logo.png').to_s
    super(
    	page_layout: :landscape,
    	page_size: "A6",
    	top_margin: 10,
    	left_margin: 10,
    	right_margin: 10,
    	bottom_margin: 10,
    	# background: image_url,
    )
    image open(image_url), position: :center, :fit=> [20,20]
    @donation = donation
    @contact = donation.contact
    generate_receipt
  end

  def generate_receipt
  	text "<b>Guelph Sikh Society</b>", align: :center, inline_format: true, size: 30
  	text "70 stevenson St. S., Guelph, ON N1H 5N4", align: :center, inline_format: true
  	bounding_box([50, 200], :width => (bounds.width/2)-5) do 
  		text "NO. #{@donation.id.to_s.rjust(6, "0")}"
      # @header_pos<<y
    end
    bounding_box([250, 200], :width => (bounds.width/2)-5) do 
  		text "Date: #{Date.today}"
      # @header_pos<<y
    end
    text "Received from Mr./Mrs. <b>#{@contact.try(:full_name)}<b>", inline_format: true
    # self.y = self.y+40
    text "Amount: <b>#{NumbersInWords.in_words(@donation.amount)}<b>", inline_format: true
    text "Address: <b> #{@contact.address}</b>", inline_format: true
		text "Tel: <b>(#{@contact.phone_type.try(:capitalize) || 'Mobile' }) #{@contact.phone}</b> Email: <b>#{@contact.email}</b>", inline_format: true
		text "Payment Received By: <b>#{@donation.payment_mode.try(:name)}</b>", inline_format: true
		text "$#{@donation.currency.blank? ? '' : '('+@donation.currency.name+')'}: <b>#{@donation.amount}<b>", inline_format: true
		text "For Purpose: <b>#{@donation.payment_purpose.try(:name)}</b>", inline_format: true
		bounding_box([0, 20], :width => (bounds.width/2)-5) do 
			text "BN #11894 9387 RR0001"
    end
		bounding_box([250, 40], :width => (bounds.width/2)-5) do 
			text "-------------"
  		text "Treasurer"
  		text "TEL: (519) 822-1112"
    end
  end
end
