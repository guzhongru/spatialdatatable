# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

rcppAlongTrack <- function(latFrom, lonFrom, latTo, lonTo, pointLat, pointLon, tolerance) {
    .Call('_spatialdatatable_rcppAlongTrack', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo, pointLat, pointLon, tolerance)
}

rcppDist2gc <- function(latFrom, lonFrom, latTo, lonTo, pointLat, pointLon, tolerance) {
    .Call('_spatialdatatable_rcppDist2gc', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo, pointLat, pointLon, tolerance)
}

rcppDestination <- function(latFrom, lonFrom, distance, bearing) {
    .Call('_spatialdatatable_rcppDestination', PACKAGE = 'spatialdatatable', latFrom, lonFrom, distance, bearing)
}

rcppMidpoint <- function(latFrom, lonFrom, latTo, lonTo) {
    .Call('_spatialdatatable_rcppMidpoint', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo)
}

rcppBearing <- function(latFrom, lonFrom, latTo, lonTo, compassBearing) {
    .Call('_spatialdatatable_rcppBearing', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo, compassBearing)
}

rcppDistanceHaversine <- function(latFrom, lonFrom, latTo, lonTo, tolerance) {
    .Call('_spatialdatatable_rcppDistanceHaversine', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo, tolerance)
}

rcppDistanceCosine <- function(latFrom, lonFrom, latTo, lonTo) {
    .Call('_spatialdatatable_rcppDistanceCosine', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo)
}

rcppDistanceEuclidean <- function(latFrom, lonFrom, latTo, lonTo) {
    .Call('_spatialdatatable_rcppDistanceEuclidean', PACKAGE = 'spatialdatatable', latFrom, lonFrom, latTo, lonTo)
}

rcppPointsInPolygon <- function(pointsId, pointsX, pointsY, vectorX, vectorY) {
    .Call('_spatialdatatable_rcppPointsInPolygon', PACKAGE = 'spatialdatatable', pointsId, pointsX, pointsY, vectorX, vectorY)
}

rcppWindingNumber <- function(pointX, pointY, vectorX, vectorY) {
    .Call('_spatialdatatable_rcppWindingNumber', PACKAGE = 'spatialdatatable', pointX, pointY, vectorX, vectorY)
}

rcpp_decode_pl <- function(encoded) {
    .Call('_spatialdatatable_rcpp_decode_pl', PACKAGE = 'spatialdatatable', encoded)
}

rcpp_encode_pl <- function(latitude, longitude, num_coords) {
    .Call('_spatialdatatable_rcpp_encode_pl', PACKAGE = 'spatialdatatable', latitude, longitude, num_coords)
}

rcppPolylineDistance <- function(encodedStrings) {
    .Call('_spatialdatatable_rcppPolylineDistance', PACKAGE = 'spatialdatatable', encodedStrings)
}

rcppPolylineArea <- function(encodedStrings) {
    .Call('_spatialdatatable_rcppPolylineArea', PACKAGE = 'spatialdatatable', encodedStrings)
}

rcppDouglasPeucker <- function(polyline, distanceTolerance) {
    .Call('_spatialdatatable_rcppDouglasPeucker', PACKAGE = 'spatialdatatable', polyline, distanceTolerance)
}

rcppSimplifyPolyline <- function(polyline, distanceTolerance, tolerance) {
    .Call('_spatialdatatable_rcppSimplifyPolyline', PACKAGE = 'spatialdatatable', polyline, distanceTolerance, tolerance)
}

rcppEarthRadius <- function() {
    .Call('_spatialdatatable_rcppEarthRadius', PACKAGE = 'spatialdatatable')
}

