Rails.application.routes.draw do
  get("/", { :controller => "calculations", :action => "instructions" })
  get('/square/:number_to_sq', { :controller => 'calculations', :action => 'sq'})
  get('/square_root/:number_to_sqrt', { :controller => 'calculations', :action => 'sqrt'})
  get('/random/:random_from/:random_to', { :controller => 'calculations', :action => 'random'})
  get('/payment/:nb_basis_points/:nb_years/:loan_principal', { :controller => 'calculations', :action => 'payment'})
end
