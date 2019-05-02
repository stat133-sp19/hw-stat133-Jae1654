library(testthat)

source("../../R/main.R")

context("Tests for binomial functions")



test_that("Test bin_choose function", {
  expect_equal(bin_choose(5, 2),10)
  expect_error(bin_choose(2,5))
  expect_length(bin_choose(5,2),1)
  expect_type(bin_choose(5,2),"double")

})


test_that("Test bin_probability function", {

  expect_equal(bin_probability(2,5,0.2),factorial(5)/(factorial(2)*factorial(3))*(0.2^2)*(0.8^3))
  expect_error(bin_probability(5,2,0.2))
  expect_length(bin_probability(2,5,0.3),1)
  expect_type(bin_probability(2,5,0.3),"double")

})

test_that("Test bin_distribution function", {
  expect_error(bin_distribution(5,2))
  expect_length(bin_distribution(5,0.5),2)
  expect_type(bin_distribution(5,0.5),"list")
})

test_that("Test bin_cumulative function", {
  expect_error(bin_cumulative(5,2))
  expect_length(bin_cumulative(5, 0.5),3)
  expect_type(bin_cumulative(5, prob = 0.5),"list")
})
