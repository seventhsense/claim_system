class DocumentsController < ApplicationController
  def new
    charge_id = Charge.find(params[:format]).id
    @document = Document.new({filetype: 'demand', charge_id: charge_id})
  end

  def create
    document_params = params.require(:document).permit(:filename, :filetype, :charge_id)
    @document = Document.new(document_params)
    send_file download_odt(@document), filename: "#{@document.filename}.odt"

  end

  private
  def download_odt(document)
    file_path = 'tmp/'
    downloadfile = 'demand_output.odt'
    document.generate_document
    
    file_path + downloadfile
  end

end
