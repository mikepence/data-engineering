DataEngineering::App.controllers :home do

  get :index, :map => '/' do
    render 'index.haml'
  end

  post :create_submission do
    if params[:submission]
      tmpfile = params['submission']['input_file'][:tempfile]
      clear_database
      begin
        if Importer.import(tmpfile)
          redirect '/success'
        end
      rescue Exception => e
          redirect '/failure'
      ensure
         tmpfile.close
         tmpfile.unlink
      end
    else
      redirect '/'
    end
  end

  get :success, :map => '/success' do
    @gross_revenue = repository(:default).adapter.select(
        'SELECT sum(price * purchase_count) from purchases, pricings where purchases.pricing_id = pricings.id').first
    render 'success.haml'
  end

  get :failure, :map => '/failure' do
    render 'failure.haml'
  end
end
