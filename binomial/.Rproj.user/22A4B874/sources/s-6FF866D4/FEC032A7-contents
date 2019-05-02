library(testthat)

source("../../R/private-auxiliary.R")

context("Tests for auxiliary functions")


test_that("Test aux_mean function",{
  expect_equal(aux_mean(4,0.5),2)
  expect_length(aux_mean(4,0.5),1)
  expect_type(aux_mean(4,0.5), "double")
})

test_that("Test aux_variance function",{
  expect_equal(aux_variance(4,0.5),1)
  expect_length(aux_variance(4,0.5),1)
  expect_type(aux_variance(4,0.5), "double")
})

test_that("Test aux_mode function",{
  expect_equal(aux_mode(4,0.5),2)
  expect_equal(aux_mode(3,0.5),c(2,1))
  expect_length(aux_mode(4,0.5),1)
  expect_length(aux_mode(3,0.5),2)
  expect_type(aux_mode(4,0.5), "double")
})

test_that("Test aux_skewness function",{
  expect_equal(aux_skewness(10,0.3),(1-2*0.3)/sqrt((10*0.3)*(1-0.3)))
  expect_length(aux_skewness(10,0.3),1)
  expect_type(aux_skewness(10,0.3), "double")
})

test_that("Test aux_kurtosis function",{
  expect_equal(aux_kurtosis(10,0.3), (1-6*0.3*(1-0.3))/((10*0.3)*(1-0.3)))
  expect_length(aux_kurtosis(10,0.3), 1)
  expect_type(aux_kurtosis(10,0.3), "double")
})


