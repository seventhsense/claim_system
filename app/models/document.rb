class Document < ActiveRecord::Base
  include Serenity::Generator
  belongs_to :charge
  accepts_nested_attributes_for :charge

  def generate_document
    @title = '請求書'
    @demand_date = Time.now.strftime("%Y年%m月%d日")
    @id = self.charge.id
    @client_name = self.charge.client.name
    @subject = self.charge.subject
    @grand_total = number_to_currency self.charge.grand_total
    @total = number_to_currency self.charge.total
    @tax = number_to_currency self.charge.tax
    @orders = self.charge.orders
    render_odt 'template/demand.odt'
  end

  def number_to_currency(number)
    # number.to_s.reverse.gsub(/(\d{3})(?=\d)/,'\1,').reverse
    # number.to_s.reverse.scan(/\d{3}|.$/).join(",").reverse
    ActiveSupport::NumberHelper.number_to_currency(number, {unit: '¥', precision: 0})
  end
end
