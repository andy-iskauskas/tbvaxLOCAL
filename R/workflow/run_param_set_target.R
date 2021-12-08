run_param_set_target <- function(model, cc, params, params_uid, vx_chars, vx_inc = NA) {
  
  # set.paths = initialize the params
  model_paths <- model$set.paths(countrycode  = cc,
                                 xml          = vx_chars$xml,
                                 VXa.incidence.files = vx_inc,
                                 parameters   = "input.csv",
                                 targets = "target.csv")
  
  # Run the model with the parameter set
  output = model$run(model, new.parameter.values = params)
  
  # Add the vaccine characteristics
  combined_ipj <- data.frame(uid = params_uid, hits = sum(output[["hits"]]$fit))
  combined_ipj
}
