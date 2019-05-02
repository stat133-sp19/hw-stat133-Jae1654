library(testthat)

source("../../R/private-checker.R")

context("Tests for checker functions")

test_that("Test check_prob function",{
  expect_true(check_prob(1))
  expect_error(check_prob(2))
  expect_length(check_prob(0.5),1)
  expect_type(check_prob(0.5),"logical")
} )

test_that("Test check_trials function",{
  expect_true(check_trials(5))
  expect_error(check_trials(1:2))
  expect_error(check_trials(-1))
  expect_error(check_trials(0.1))
  expect_length(check_trials(2),1)
  expect_type(check_trials(2),"logical")

})

test_that("Test check_success function",{
  expect_true(check_success(4,4))
  expect_true(check_success(1:2,2))
  expect_error(check_success(4,3))
  expect_error(check_success(c(-1:1),4))
  expect_length( check_success(3,9),1)
  expect_type(check_success(4,10),"logical")


} )

