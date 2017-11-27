#' Title
#'
#' @param n_rep
#' @param n_samp
#' @param beta0
#' @param beta1
#'
#' @return
#' @export
#'
#' @examples
#' # simulate a single dataset
#' sim_regression(30, 2, 3)
simulate_nrep = function(n_rep, n_samp, beta0, beta1) {

  rerun(n_rep, sim_regression(n_samp, beta0, beta1)) %>%
    bind_rows()

}
