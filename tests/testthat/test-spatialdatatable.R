context("spatialdatatable")

library(googleway)
library(sp)
library(sf)

## TODO:
## data.table 'global' options are unmodified

test_that("setSDT() sets attributes", {

	dt <- data.table(id = 1:5)
	setSDT(dt)
	print(str(dt))
	expect_true(
		"spatialdatatable" %in% class(dt)
		)

	setSDT(dt, polyline_column = "id")
	print(str(dt))
	expect_true(
		"spatialdatatable" %in% class(dt)
		)

	# print(str(dt))
	# ats = sapply(dt, function(x) names(attributes(x)))
	# print(ats)
	# expect_true(
	# 	names(which(ats == "sdt_polyline")) == "id"
	# 	)

})


test_that("setSDT works in a function", {

	dt <- data.table(id = 1:5)
	foo <- function(x){
		setSDT(x)
	}

	foo(dt)
	expect_true("spatialdatatable" %in% class(dt))

	dt <- data.table(id = 1:5)
	foo <- function(x){
		setSDT(x)
		x[, val := letters[1:5]]
	}

	foo(dt)
	expect_true("val" %in% names(dt))

	dt <- data.table(id = 1:5)
	dt2 <- foo(dt)
	expect_true(identical(dt, dt2))
})


test_that("spatialdatatable created from sp & sf objects", {

	## SpatialPointsDataFrame
	sp <- SpatialPointsDataFrame(coords = tram_stops[, c("stop_lon", "stop_lat")], data = tram_stops)
	dt <- toSDT(sp)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	## spLine
	spLine <- Line(tram_route[, c("shape_pt_lat", "shape_pt_lon")])
	dt <- toSDT(spLine)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	##...

	## sfc MULTIPOINT
	p <- rbind(c(3.2,4), c(3,4.6), c(3.8,4.4), c(3.5,3.8), c(3.4,3.6), c(3.9,4.5))
	mp <- st_multipoint(p)
	dt <- toSDT(mp)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	## sfg LINESTRING
	s1 <- rbind(c(0,3),c(0,4),c(1,5),c(2,5))
	ls <- st_linestring(s1)
	dt <- toSDT(ls)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	## sfc MULTILINESTRING
	s2 <- rbind(c(0.2,3), c(0.2,4), c(1,4.8), c(2,4.8))
	s3 <- rbind(c(0,4.4), c(0.6,5))
	mls <- st_multilinestring(list(s1,s2,s3))
	dt <- toSDT(mls)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	## sfc POLYGONS
	p1 <- rbind(c(0,0), c(1,0), c(3,2), c(2,4), c(1,4), c(0,0))
	p2 <- rbind(c(1,1), c(1,2), c(2,2), c(1,1))
	pol <-st_polygon(list(p1,p2))
	dt <- toSDT(pol)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))

	## sfc MULTIPOLYGON
	p3 <- rbind(c(3,0), c(4,0), c(4,1), c(3,1), c(3,0))
	p4 <- rbind(c(3.3,0.3), c(3.8,0.3), c(3.8,0.8), c(3.3,0.8), c(3.3,0.3))[5:1,]
	p5 <- rbind(c(3,3), c(4,2), c(4,3), c(3,3))
	mpol <- st_multipolygon(list(list(p1,p2), list(p3,p4), list(p5)))
	dt <- toSDT(mpol)
	expect_true('spatialdatatable' %in% attr(dt, 'class'))


})


test_that("data.table update-by-reference creates new column", {

	sdt <- copy(sdt_melbourne)
	sdt[, p := polyline]
	expect_true(
		"p" %in% names(sdt)
	)

	## new column contains the 'sdt_polyline' attribute
	expect_true(
		names(attributes(sdt$p)) == "sdt_polyline"
	)

	expect_true(
		attributes(sdt$p) == "polyline"
	)

})

test_that("data.table update-by-references doesn't print", {
	sdt <- copy(sdt_melbourne)
	expect_silent(sdt[, p := polyline])
})

# test_that("spatialdatatable print truncates polyline column", {
#
# 	sdt <- copy(sdt_melbourne)
# 	expect_output(print(sdt))
#
# })

