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
    @grand_total = self.charge.grand_total
    @total = self.charge.total
    @tax = self.charge.tax
    @orders = self.charge.orders
    render_odt 'tmp/demand.odt'
  end
end
