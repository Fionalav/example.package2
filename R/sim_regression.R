#' Simulate from an SLR
#'
#' Simualtes data from a simple linear regression model with user-defined
#' sample size and regression coefficients. Fits a SLR to the simulated
#' data and returns regression coefficients.
#'
#' @param n_samp sample size
#' @param beta0 intercept
#' @param beta1 slope
#'
#' @return tbl_df with one row, containing sample size and coef estimates
#' @export
#'
#' @examples
sim_regression = function(n_samp, beta0, beta1) {

  sim_data = tibble(
    x = rnorm(n_samp, mean = 1, sd = 1),
    y = beta0 + beta1 * x + rnorm(n_samp, 0, 1)
  )

  ls_fit = lm(y ~ x, data = sim_data) %>%
    tidy()

  tibble(
    n = n_samp,
    beta0_hat = pull(ls_fit, estimate)[1],
    beta1_hat = pull(ls_fit, estimate)[2]
  )
}
